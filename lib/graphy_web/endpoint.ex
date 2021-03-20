defmodule GraphyWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :graphy

  @session_options [
    store: :cookie,
    key: "_graphy_key",
    signing_salt: "Op72oxLO"
  ]

  socket "/socket", GraphyWeb.UserSocket,
    websocket: true,
    longpoll: false

  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug GraphyWeb.Router
end
