defmodule MctNuke.Dictionary do
  alias MctNuke.Dictionary.Data
  alias MctNuke.Dictionary.Folder
  alias MctNuke.Dictionary.Derived
  alias MctNuke.Dictionary.Conversion

  def json do
    Data.root()
    |> Folder.to_json()
  end

  def all_metrics(%Folder{} = folder \\ Data.root()) do
    folder.subfolders
    |> Enum.flat_map(&all_metrics/1)
    |> Kernel.++(folder.metrics)
  end

  def for_history(key) do
    Derived.for_history(key) ||
      Conversion.for_history(key) ||
      {key, &Function.identity/1}
  end
end
