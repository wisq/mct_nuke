defmodule MctNuke.API do
  defp api_url do
    case System.fetch_env("NUKE_URL") do
      {:ok, url} -> url
      :error -> Application.fetch_env!(:mct_nuke, :api_url)
    end
  end

  defp req_new do
    Req.new(
      base_url: api_url(),
      retry: false,
      connect_options: [
        timeout: 100
      ]
    )
  end

  defp get(key) do
    req_new()
    |> Req.get!(url: "/", params: [variable: key])
    |> then(fn %Req.Response{status: s, body: body} when s in [200, 500] -> body end)
  end

  def get_integer(key), do: get(key) |> String.to_integer()
  def get_json(key), do: get(key) |> Jason.decode!()
end
