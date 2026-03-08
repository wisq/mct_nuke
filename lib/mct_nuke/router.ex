defmodule MctNuke.Router do
  use Plug.Router

  alias MctNuke.Collector
  alias MctNuke.Stats

  plug(CORSPlug)
  plug(Plug.Logger)
  plug(:fetch_query_params)
  plug(:match)
  plug(:dispatch)

  get "/dictionary.json" do
    conn
    |> put_resp_header("content-type", "application/json")
    |> send_file(200, priv("dictionary.json"))
  end

  get "/history/:key" do
    IO.inspect(conn.query_params, label: "history")

    data =
      Collector.get()
      |> Stats.history(key)
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
