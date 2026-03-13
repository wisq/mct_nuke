defmodule MctNuke.Stats do
  @enforce_keys [:data, :size, :latest_ts]
  defstruct(@enforce_keys)
  alias __MODULE__

  # Collect up to one week of game data:
  @max_size 60 * 24 * 7

  # Nucleares timestamps represent minutes since the start of day zero.
  # OpenMCT expects milliseconds, so we multiply values by this factor:
  @ts_factor 60 * 1000

  def new do
    %Stats{
      data: :queue.new(),
      size: 0,
      latest_ts: -1
    }
  end

  def size(%Stats{size: size}), do: size
  def is_new?(%Stats{latest_ts: data_ts}, game_ts), do: data_ts != game_ts * @ts_factor

  def add(%Stats{} = stats, data) do
    new_ts = Map.fetch!(data, "TIME_STAMP") * @ts_factor

    stats
    |> append(new_ts, data)
    |> shrink_to(@max_size)
  end

  def history(%Stats{} = stats, key, min, max) do
    stats.data
    |> :queue.to_list()
    |> limit_history(min, max)
    |> Enum.map(fn {timestamp, values} ->
      v = Map.fetch!(values, key)
      %{id: key, timestamp: timestamp, value: v}
    end)
  end

  defp limit_history(data, nil, nil), do: data

  defp limit_history(data, min, nil) when is_number(min) do
    data |> Enum.filter(fn {ts, _} -> ts >= min end)
  end

  defp limit_history(data, nil, max) when is_number(max) do
    data |> Enum.filter(fn {ts, _} -> ts <= max end)
  end

  defp limit_history(data, min, max) when is_number(min) and is_number(max) do
    data |> Enum.filter(fn {ts, _} -> ts >= min && ts <= max end)
  end

  def telemetry(%Stats{size: size} = stats) when size > 0 do
    {ts, data} = :queue.last(stats.data)

    %{
      type: "telemetry",
      timestamp: ts,
      value: data
    }
  end

  def purge_after(%Stats{} = stats, cutoff) do
    purge_ts(stats, cutoff * @ts_factor)
  end

  defp purge_ts(%Stats{latest_ts: ts} = stats, cutoff) when ts <= cutoff, do: {stats, 0}
  defp purge_ts(%Stats{latest_ts: nil} = stats, _cutoff), do: {stats, 0}

  defp purge_ts(%Stats{latest_ts: ts} = old_stats, cutoff) when ts > cutoff do
    old_stats.data
    |> :queue.to_list()
    |> Enum.take_while(fn {ts, _} -> ts < cutoff end)
    |> then(fn
      [] ->
        Stats.new()

      data ->
        %Stats{
          data: data,
          size: data |> Enum.count(),
          latest_ts: data |> Enum.at(-1) |> elem(0)
        }
    end)
    |> then(fn new_stats ->
      {new_stats, old_stats.size - new_stats.size}
    end)
  end

  defp append(%Stats{} = stats, timestamp, values) do
    point = {timestamp, values}

    %Stats{
      data: :queue.in(point, stats.data),
      size: stats.size + 1,
      latest_ts: timestamp
    }
  end

  defp shrink_to(%Stats{size: from_size} = stats, to_size)
       when from_size <= to_size and to_size > 0,
       do: stats

  defp shrink_to(%Stats{size: from_size} = stats, to_size)
       when from_size > to_size and to_size > 0 do
    %Stats{
      data: :queue.drop(stats.data),
      size: stats.size - 1,
      latest_ts: stats.latest_ts
    }
    |> shrink_to(to_size)
  end
end
