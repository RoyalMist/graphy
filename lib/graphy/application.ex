defmodule Graphy.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
    children = [
      GraphyWeb.Telemetry,
      {Phoenix.PubSub, name: Graphy.PubSub},
      GraphyWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Graphy.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    GraphyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
