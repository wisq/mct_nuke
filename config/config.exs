import Config

config :logger, :console, format: "$time $metadata[$level] $message\n"

config :mct_nuke, api_url: "http://localhost:8785"

import_config "#{Mix.env()}.exs"
