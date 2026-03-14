defmodule MctNuke.Dictionary.Folder do
  @enforce_keys [:name, :key]
  defstruct(
    name: nil,
    key: nil,
    subfolders: [],
    metrics: []
  )

  alias __MODULE__
  alias MctNuke.Dictionary.Metric
  alias MctNuke.Dictionary.Conversion

  def to_json(%Folder{} = folder) do
    subfolders = folder.subfolders |> Enum.map(&to_json/1)

    metrics =
      folder.metrics
      |> Enum.flat_map(&Conversion.with_conversions/1)
      |> Enum.map(&Metric.to_json/1)

    %{
      type: :folder,
      name: folder.name,
      key: folder.key,
      children: subfolders ++ metrics
    }
  end

  def sort_key(%Folder{} = folder) do
    first = Enum.at(folder.metrics, 0) || Enum.at(folder.subfolders, 0)

    first_index =
      case first do
        %Metric{api_index: i} -> i
        %Folder{} = f -> sort_key(f) |> elem(0)
      end

    {first_index, folder.name}
  end

  def generate_tree(key, metrics_by_folder) do
    {metrics, sub_metrics} = Map.pop(metrics_by_folder, key, [])

    subfolders =
      sub_metrics
      |> Enum.group_by(fn {subkey, _} -> next_folder_key(key, subkey) end)
      |> Enum.map(fn {next_key, sub_metrics_by_key} ->
        generate_tree(next_key, Map.new(sub_metrics_by_key))
      end)

    %Folder{
      name: folder_name(key),
      key: key,
      metrics: metrics |> Enum.sort_by(&Metric.sort_key/1),
      subfolders: subfolders |> Enum.sort_by(&sort_key/1)
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

  defp folder_name(:root), do: "Nucleares"

  defp folder_name(key) do
    key
    |> String.split(".")
    |> Enum.at(-1)
    |> String.split("_")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end
end
