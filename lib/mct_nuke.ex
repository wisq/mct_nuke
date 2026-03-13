defmodule MctNuke do
  use Application

  def start(_type, _args) do
    children =
      if start?() do
        [
          PubSub,
          MctNuke.Collector,
          {Bandit, web_options()}
        ]
      else
        []
      end

    opts = [strategy: :one_for_one, name: MctNuke.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp start?, do: Application.get_env(:mct_nuke, :start, false)

  defp web_options do
    ip = Application.get_env(:mct_nuke, :bind_to_ip, "127.0.0.1")
    port = Application.get_env(:mct_nuke, :bind_to_port, 8081)

    [
      plug: MctNuke.Router,
      scheme: :http,
      ip: ip_tuple(ip),
      port: port
    ]
  end

  defp ip_tuple(ip) when is_tuple(ip), do: ip

  defp ip_tuple(str) when is_binary(str) do
    {:ok, ip} = str |> String.to_charlist() |> :inet.parse_address()
    ip
  end
end
