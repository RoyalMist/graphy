import Config

secret_key =
  System.get_env("SECRET_KEY") ||
    raise """
    environment variable SECRET_KEY is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :graphy, GraphyWeb.Endpoint,
  server: true,
  secret_key_base: secret_key,
  http: [
    port: 4000,
    transport_options: [socket_opts: [:inet6]]
  ]
