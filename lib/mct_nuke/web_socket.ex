defmodule MctNuke.WebSocket do
  @behaviour WebSock

  alias MctNuke.Collector
  alias MctNuke.Stats

  # Initialize the connection
  def init(state) do
    PubSub.subscribe(self(), :realtime)
    send(self(), {:telemetry, Collector.get() |> Stats.telemetry()})
    {:ok, state}
  end

  # Handle incoming text messages
  def handle_in(input, state) do
    IO.inspect(input, label: "handle_in")
    {:ok, state}
  end

  def handle_info({:telemetry, telemetry}, state) do
    {:push, [{:text, Jason.encode!(telemetry)}], state}
  end

  def handle_info(msg, state) do
    IO.inspect(msg, label: "handle_info")
    {:ok, state}
  end

  def terminate(_reason, _state), do: :ok
end
