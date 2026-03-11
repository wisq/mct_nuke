defmodule MctNuke.Dictionary.Metric do
  @enforce_keys [:name, :key, :format]
  defstruct(
    name: nil,
    key: nil,
    format: nil,
    units: nil
  )
end
