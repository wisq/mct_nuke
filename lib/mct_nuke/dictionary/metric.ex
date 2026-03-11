defmodule MctNuke.Dictionary.Metric do
  @enforce_keys [:name, :key, :format]
  defstruct(
    name: nil,
    key: nil,
    format: nil,
    units: nil
  )

  def to_dictionary_json(metric) do
    %{
      name: metric.name,
      key: metric.key,
      values: [
        %{
          key: "value",
          name: "Value",
          hints: %{range: 1}
        }
        |> apply_format(metric.format)
        |> apply_units(metric.units),
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

  defp apply_units(map, nil), do: map
  defp apply_units(map, units) when is_binary(units), do: map |> Map.put(:units, units)
end
