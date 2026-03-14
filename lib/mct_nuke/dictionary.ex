defmodule MctNuke.Dictionary do
  alias MctNuke.Dictionary.Data
  alias MctNuke.Dictionary.Folder

  def json do
    Data.root()
    |> Folder.to_json()
  end

  def all_metrics(%Folder{} = folder \\ Data.root()) do
    folder.subfolders
    |> Enum.flat_map(&all_metrics/1)
    |> Kernel.++(folder.metrics)
  end
end
