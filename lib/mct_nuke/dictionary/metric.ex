defmodule MctNuke.Dictionary.Metric do
  @enforce_keys [:name, :key, :format, :api_index]
  defstruct(
    api_index: nil,
    name: nil,
    key: nil,
    format: nil,
    units: nil,
    min: nil,
    max: nil
  )

  alias __MODULE__

  def to_json(metric) do
    %{
      type: :telemetry,
      name: metric.name,
      key: metric.key,
      values: [
        %{
          key: "value",
          name: "Value",
          hints: %{range: 1}
        }
        |> apply_format(metric.format)
        |> maybe_apply(:units, metric.units)
        |> maybe_apply(:min, metric.min)
        |> maybe_apply(:max, metric.max),
        %{
          key: "nucleares-time",
          source: "timestamp",
          name: "Time",
          format: "nucleares-time-format",
          hints: %{domain: 1}
        }
      ]
    }
  end

  def sort_key(%Metric{api_index: i, name: n}), do: {i, n}

  defp apply_format(map, :boolean) do
    map
    |> Map.put(:format, :enum)
    |> Map.put(:enumerations, [
      %{string: "False", value: 0},
      %{string: "True", value: 1}
    ])
  end

  defp apply_format(map, other) when other in [:string, :integer, :float] do
    map
    |> Map.put(:format, other)
  end

  defp maybe_apply(map, _key, nil), do: map
  defp maybe_apply(map, key, value), do: map |> Map.put(key, value)
end
