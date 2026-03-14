defmodule MctNuke.Dictionary.Conversion do
  alias MctNuke.Dictionary
  alias MctNuke.Dictionary.Metric

  @enforce_keys [:key, :source_key, :units, :fun_name]
  defstruct(@enforce_keys)
  alias __MODULE__

  defmodule Functions do
    def kilo_to_mega(k), do: k / 1000
    def mega_to_kilo(k), do: k * 1000

    def for_unit("kW"), do: [kilo_to_mega: "MW"]
    def for_unit("MW"), do: [mega_to_kilo: "kW"]
    def for_unit(_), do: []

    def maybe_apply(_, nil), do: nil
    def maybe_apply(name, value), do: apply(__MODULE__, name, [value])
  end

  defmodule Generator do
    def for_metric(%Metric{} = metric) do
      Functions.for_unit(metric.units)
      |> Enum.map(fn {fun_name, new_units} ->
        %Conversion{
          key: metric.key <> "~" <> new_units,
          source_key: metric.key,
          units: new_units,
          fun_name: fun_name
        }
      end)
    end
  end

  @conversions Dictionary.all_metrics() |> Enum.flat_map(&Generator.for_metric/1)
  @by_key @conversions |> Map.new(fn c -> {c.key, c} end)
  @by_source_key @conversions |> Enum.group_by(fn c -> c.source_key end)

  def with_conversions(%Metric{} = metric) do
    case Map.fetch(@by_source_key, metric.key) do
      {:ok, conversions} ->
        real = %Metric{metric | name: name_with_units(metric.name, metric.units)}
        virtuals = conversions |> Enum.map(&virtual_metric(metric, &1))
        [real | virtuals]

      :error ->
        [metric]
    end
  end

  defp name_with_units(name, units), do: "#{name} (#{units})"

  defp virtual_metric(%Metric{} = metric, %Conversion{} = conv) do
    %Metric{
      metric
      | name: name_with_units(metric.name, conv.units),
        key: conv.key,
        units: conv.units,
        min: Functions.maybe_apply(conv.fun_name, metric.min),
        max: Functions.maybe_apply(conv.fun_name, metric.max)
    }
  end

  def for_history(key) do
    case Map.fetch(@by_key, key) do
      {:ok, c} -> {c.source_key, Function.capture(Functions, c.fun_name, 1)}
      :error -> nil
    end
  end

  def add_telemetry(telemetry) do
    telemetry
    |> Map.update!(:value, fn data ->
      @conversions
      |> Enum.reduce(data, &add_conversion/2)
    end)
  end

  defp add_conversion(%Conversion{} = conv, data) do
    value = Map.fetch!(data, conv.source_key)

    data
    |> Map.put(conv.key, apply(Functions, conv.fun_name, [value]))
  end
end
