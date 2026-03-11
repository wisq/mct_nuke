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
    metrics = Dictionary.metrics_json()

    json = %{
      name: "Nucleares",
      key: "nuke",
      measurements: metrics
    }

    conn
    |> send_json(200, json)
  end

  get "/history/:key" do
    conn = fetch_query_params(conn)

    range =
      case conn.query_params do
        %{"start" => min, "end" => max} -> String.to_integer(min)..String.to_integer(max)//1
        %{} -> nil
      end

    data =
      Collector.get()
      |> Stats.history(key, range)

    conn
    |> send_json(200, data)
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
end
