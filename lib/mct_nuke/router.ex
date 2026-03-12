defmodule MctNuke.Router do
  use Plug.Router

  alias MctNuke.Collector
  alias MctNuke.Stats
  alias MctNuke.Dictionary

  plug(CORSPlug)
  plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)

  get "/dictionary.json" do
    conn
    |> send_json(200, Dictionary.json())
  end

  get "/history/:key" do
    conn = fetch_query_params(conn)

    with {:ok, min} <- conn.query_params |> Map.get("start") |> parse_time(),
         {:ok, max} <- conn.query_params |> Map.get("end") |> parse_time() do
      data =
        Collector.get()
        |> Stats.history(key, min, max)

      conn
      |> send_json(200, data)
    else
      {:error, msg} ->
        conn
        |> send_json(400, %{error: msg})
    end
  end

  get "/realtime" do
    conn
    |> upgrade_adapter(:websocket, {MctNuke.WebSocket, :ok, compress: true})
  end

  match _ do
    send_resp(conn, 404, "oops")
  end

  defp send_json(conn, code, data) do
    json = Jason.encode!(data)

    conn
    |> put_resp_header("content-type", "application/json")
    |> send_resp(code, json)
  end

  defp parse_time(nil), do: {:ok, nil}

  defp parse_time(str) do
    case Float.parse(str) do
      {f, ""} -> {:ok, f}
      {_, _} -> {:error, "Not a number: #{inspect(str)}"}
    end
  end
end
