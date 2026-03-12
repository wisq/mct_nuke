defmodule MctNuke.Dictionary do
  alias MctNuke.Dictionary.Data
  alias MctNuke.Dictionary.Folder

  def json do
    Data.root()
    |> Folder.to_json()
  end
end
