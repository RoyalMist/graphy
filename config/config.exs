import Config

config :graphy, GraphyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Y8DAS1P1CzbN741eFUuxVQDL/Q4upN+yqSLvkmfFl6/QWe0+l+NIFG/YVBy++FgY",
  render_errors: [view: GraphyWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Graphy.PubSub,
  live_view: [signing_salt: "ccBk1T/0"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
