defmodule GraphyWeb.Router do
  use GraphyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GraphyWeb do
    pipe_through :api
  end
end
