defmodule GraphyWeb.Graphql.Schema do
  @moduledoc false
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)
  import_types(Absinthe.Plug.Types)
  import_types(GraphyWeb.Graphql.Types.Users)
  import_types(GraphyWeb.Graphql.Types.Preferences)

  query do
    import_fields(:users_queries)
  end

  # mutation do
  # import_fields(:_NAME_mutations)
  # end

  # subscription do
  # import_fields(:_NAME_subscriptions)
  # end
end
