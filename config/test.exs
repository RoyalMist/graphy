import Config

config :graphy, GraphyWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warn
