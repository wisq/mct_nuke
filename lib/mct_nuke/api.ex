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
      max_retries: 2,
      retry_delay: fn _ -> 500 end
    )
  end

  defp get(key) do
    req_new()
    |> Req.get!(url: "/", params: [variable: key])
    |> then(fn %Req.Response{status: 200, body: body} -> body end)
  end

  def get_integer(key), do: get(key) |> String.to_integer()
  def get_json(key), do: get(key) |> Jason.decode!()
end
