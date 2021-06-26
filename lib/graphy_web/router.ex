defmodule GraphyWeb.Router do
  use GraphyWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/" do
    pipe_through(:api)

    if Mix.env() == :dev do
      forward("/graphiql", Absinthe.Plug.GraphiQL,
        interface: :playground,
        socket: GraphyWeb.UserSocket
      )
    end

    forward("/", Absinthe.Plug)
  end
end
