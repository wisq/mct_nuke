defmodule MctNuke.Stats do
  @enforce_keys [:ets, :size, :latest_ts]
  defstruct(@enforce_keys)
  alias __MODULE__

  # Collect up to one week of game data:
  @max_size 60 * 24 * 7

  # Nucleares timestamps represent minutes since the start of day zero.
  # OpenMCT expects milliseconds, so we multiply values by this factor:
  @ts_factor 60 * 1000

  def new(ets \\ nil) do
    %Stats{
      ets: ets || :ets.new(__MODULE__, [:ordered_set]),
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

  def history(%Stats{ets: table}, to_extract, min, max) do
    extract_fn =
      case to_extract do
        key when is_binary(key) -> &Map.fetch!(&1, key)
        keys when is_list(keys) -> &Map.take(&1, keys)
      end

    extract_history(table, min, max)
    |> Enum.map(fn {timestamp, values} ->
      {timestamp, extract_fn.(values)}
    end)
  end

  defp extract_history(table, nil, nil), do: :ets.tab2list(table)

  defp extract_history(table, min, max) do
    min = min || :ets.first(table)
    max = max || :ets.last(table)

    :ets.select(table, [
      {
        {:"$1", :"$2"},
        [
          {:>=, :"$1", min},
          {:"=<", :"$1", max}
        ],
        [{{:"$1", :"$2"}}]
      }
    ])
  end

  def telemetry(%Stats{ets: table, size: size}) when size > 0 do
    {ts, [{ts, data}]} = :ets.last_lookup(table)

    %{
      type: "telemetry",
      timestamp: ts,
      value: data
    }
  end

  def purge_from(%Stats{} = stats, cutoff) do
    purge_ts(stats, cutoff * @ts_factor)
  end

  defp purge_ts(%Stats{latest_ts: ts} = stats, cutoff) when ts < cutoff, do: {stats, 0}
  defp purge_ts(%Stats{latest_ts: nil} = stats, _cutoff), do: {stats, 0}

  defp purge_ts(%Stats{ets: table, latest_ts: ts} = stats, cutoff) when ts >= cutoff do
    if :ets.first(table) >= cutoff do
      :ets.delete_all_objects(table)
      {Stats.new(table), stats.size}
    else
      deleted = delete_after(table, cutoff)

      new_stats = %Stats{
        ets: table,
        size: stats.size - deleted,
        latest_ts: :ets.last(table)
      }

      {new_stats, deleted}
    end
  end

  defp delete_after(table, cutoff) do
    case :ets.last(table) do
      :"$end_of_table" ->
        raise "unexpected EOT"

      ts when ts < cutoff ->
        0

      ts when ts >= cutoff ->
        :ets.delete(table, ts)
        delete_after(table, cutoff) + 1
    end
  end

  defp append(%Stats{latest_ts: lts}, timestamp, _values) when timestamp <= lts do
    raise "Cannot repeat or go backwards in time: #{lts} => #{timestamp}"
  end

  defp append(%Stats{ets: table} = stats, timestamp, values) do
    :ets.insert(table, {timestamp, values})

    %Stats{
      ets: table,
      size: stats.size + 1,
      latest_ts: timestamp
    }
  end

  defp shrink_to(%Stats{size: from_size} = stats, to_size)
       when from_size <= to_size and to_size > 0,
       do: stats

  defp shrink_to(%Stats{ets: table, size: from_size} = stats, to_size)
       when from_size > to_size and to_size > 0 do
    :ets.delete(table, :ets.first(table))

    %Stats{
      ets: table,
      size: stats.size - 1,
      latest_ts: stats.latest_ts
    }
    |> shrink_to(to_size)
  end
end
