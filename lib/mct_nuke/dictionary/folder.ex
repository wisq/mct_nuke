defmodule MctNuke.Dictionary.Folder do
  @enforce_keys [:name, :key]
  defstruct(
    name: nil,
    key: nil,
    subfolders: [],
    metrics: []
  )

  alias __MODULE__

  def generate(key, metrics_by_folder) do
    {metrics, sub_metrics} = Map.pop(metrics_by_folder, key, [])

    subfolders =
      sub_metrics
      |> Enum.group_by(fn {subkey, _} -> next_folder_key(key, subkey) end)
      |> Enum.map(fn {next_key, sub_metrics_by_key} ->
        generate(next_key, Map.new(sub_metrics_by_key))
      end)

    %Folder{
      name: key,
      key: key,
      metrics: metrics,
      subfolders: subfolders
    }
  end

  defp next_folder_key(:root, subkey) do
    subkey
    |> String.split(".", parts: 2)
    |> Enum.at(0)
  end

  defp next_folder_key(key, subkey) do
    {^key, "." <> rest} = subkey |> String.split_at(String.length(key))

    rest =
      rest
      |> String.split(".", parts: 2)
      |> Enum.at(0)

    "#{key}.#{rest}"
  end
end
