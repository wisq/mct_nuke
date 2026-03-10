defmodule MctNuke.Router do
  use Plug.Router

  alias MctNuke.Collector
  alias MctNuke.Stats

  plug(CORSPlug)
  plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)

  get "/dictionary.json" do
    conn
    |> put_resp_header("content-type", "application/json")
    |> send_file(200, priv("dictionary.json"))
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
      |> Jason.encode!()

    conn
    |> put_resp_header("content-type", "application/json")
    |> send_resp(200, data)
  end

  get "/realtime" do
    conn
    |> upgrade_adapter(:websocket, {MctNuke.WebSocket, :ok, compress: true})
  end

  match _ do
    send_resp(conn, 404, "oops")
  end

  defp priv(path) do
    :code.priv_dir(:mct_nuke)
    |> Path.join(path)
  end
end
