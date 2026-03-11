defmodule MctNuke.Dictionary do
  alias MctNuke.Dictionary.Metric
  alias MctNuke.Dictionary.Data

  def metrics_json do
    Data.metrics()
    |> Enum.map(&Metric.to_dictionary_json/1)
  end
end
