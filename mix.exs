defmodule MctNuke.MixProject do
  use Mix.Project

  def project do
    [
      app: :mct_nuke,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {MctNuke, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bandit, "~> 1.10"},
      {:cors_plug, "~> 3.0"},
      {:req, "~> 0.5.0"},
      {:pubsub, "~> 1.0"}
    ]
  end
end
