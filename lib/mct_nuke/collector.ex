defmodule MctNuke.Collector do
  use GenServer
  require Logger

  alias MctNuke.API
  alias MctNuke.Stats
  alias MctNuke.Dictionary.Conversion
  alias MctNuke.Dictionary.Derived

  @log_prefix "[#{inspect(__MODULE__)}] "

  # Check stats 2x/second
  @loop_ms 500

  def start_link(opts \\ []) do
    opts = Keyword.put_new(opts, :name, __MODULE__)
    GenServer.start_link(__MODULE__, nil, opts)
  end

  def get(pid \\ __MODULE__) do
    GenServer.call(pid, :get)
  end

  @impl true
  def init(nil) do
    schedule_next()
    Logger.info(@log_prefix <> "Started.")
    {:ok, Stats.new()}
  end

  @impl true
  def handle_call(:get, _from, stats) do
    {:reply, stats, stats}
  end

  @impl true
  def handle_info(:loop, stats) do
    schedule_next()

    try do
      ts = API.get_integer("TIME_STAMP")

      if Stats.is_new?(stats, ts) do
        values =
          get_batch_vars()
          |> Map.put("VALVE_PANEL", get_valve_panel())

        stats =
          stats
          |> Stats.purge_from(ts)
          |> then(fn
            {stats, 0} ->
              stats

            {stats, n} when n > 0 ->
              Logger.warning(@log_prefix <> "Purged #{n} stats after timestamp #{ts}.")
              stats
          end)
          |> Stats.add(values)

        Logger.debug(@log_prefix <> "Collected stats for timestamp #{ts}.")
        publish_realtime(stats)
        {:noreply, stats}
      else
        {:noreply, stats}
      end
    rescue
      e in [Req.TransportError] ->
        Logger.error(@log_prefix <> "Error accessing game API: #{e.reason}")
        {:noreply, stats}
    end
  end

  defp get_batch_vars do
    %{"values" => values, "errors" => errors} = API.get_json("WEBSERVER_BATCH_GET")

    unless Enum.empty?(errors) do
      Logger.warning(@log_prefix <> "Errors detected: #{inspect(errors)}")
    end

    values
  end

  defp get_valve_panel do
    API.get_json("VALVE_PANEL_JSON")
    |> Enum.map(fn {vp_type, vp_entries} ->
      vp_type_atom = String.to_existing_atom(vp_type)

      vp_entries
      |> Enum.map(fn {key, data} ->
        case valve_panel_metrics(vp_type_atom, data) do
          nil -> nil
          values when is_map(values) -> {key, values}
        end
      end)
      |> Enum.reject(&is_nil/1)
      |> then(fn
        [] -> nil
        [_ | _] = entries -> {vp_type_atom, Map.new(entries)}
      end)
    end)
    |> Enum.reject(&is_nil/1)
    |> Map.new()
  end

  @pump_states [
    active: "Active",
    destroyed: "Destroyed",
    dry: "Dry",
    energy_sufficent: "EnergySufficent",
    flooded: "Flooded",
    maintenance_required: "MaintenanceRequired",
    overload: "Overload",
    set_speed_reached: "SetSpeedReached",
    under_construction: "UnderConstruction"
  ]

  defp valve_panel_metrics(:pumps, %{"Flow" => [flow_curr, flow_max], "State" => states}) do
    %{
      flow_rate: flow_curr,
      capacity: flow_max,
      speed: 100 * flow_curr / flow_max,
      state:
        @pump_states
        |> Enum.map(fn {metric, data_key} ->
          {metric, Map.fetch!(states, data_key)}
        end)
        |> Map.new()
    }
  end

  defp valve_panel_metrics(:vessels, %{
         "Pressure" => pressure,
         "Temperature" => temperature,
         "Volume" => [vol_curr, vol_max]
       }) do
    %{
      pressure: pressure,
      temperature: temperature,
      volume: vol_curr,
      fill_level: 100 * vol_curr / vol_max
    }
  end

  defp valve_panel_metrics(:valves, _data), do: nil
  defp valve_panel_metrics(:pipes, _data), do: nil

  defp schedule_next, do: Process.send_after(self(), :loop, @loop_ms)

  defp publish_realtime(stats) do
    Stats.telemetry(stats)
    |> Conversion.add_telemetry()
    |> Derived.add_telemetry()
    |> then(&PubSub.publish(:realtime, {:telemetry, &1}))
  end
end
