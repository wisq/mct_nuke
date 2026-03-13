defmodule MctNuke.Collector do
  use GenServer
  require Logger

  alias MctNuke.API
  alias MctNuke.Stats

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

    ts = API.get_integer("TIME_STAMP")

    if Stats.is_new?(stats, ts) do
      %{"values" => values, "errors" => errors} = API.get_json("WEBSERVER_BATCH_GET")

      unless Enum.empty?(errors) do
        Logger.warning(@log_prefix <> "Errors detected: #{inspect(errors)}")
      end

      stats =
        stats
        |> Stats.purge_after(ts)
        |> then(fn
          {stats, 0} ->
            stats

          {stats, n} when n > 0 ->
            Logger.warning(@log_prefix <> "Purged #{n} stats after timestamp #{ts}.")
            stats
        end)
        |> Stats.add(values)

      Logger.debug(@log_prefix <> "Collected stats for timestamp #{ts}.")
      PubSub.publish(:realtime, {:telemetry, Stats.telemetry(stats)})
      {:noreply, stats}
    else
      {:noreply, stats}
    end
  end

  defp schedule_next, do: Process.send_after(self(), :loop, @loop_ms)
end
