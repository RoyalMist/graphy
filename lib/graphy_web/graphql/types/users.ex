defmodule GraphyWeb.Graphql.Types.Users do
  @moduledoc false
  use Absinthe.Schema.Notation
  alias GraphyWeb.Graphql.Resolvers

  object :user do
    field(:id, :id)
    field(:name, :string)
    field(:email, :string)
    field(:preferences, :preferences)
  end

  object :users_queries do
    @desc "Get a specific user with its id"
    field :user, :user do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Users.get/2)
    end

    @desc "List the users with an optional filtering on preferences"
    field :users, list_of(:user) do
      arg(:likes_emails, :boolean)
      arg(:likes_phone_calls, :boolean)
      resolve(&Resolvers.Users.list/2)
    end
  end

  # object :user_mutations do
  #  @desc "Description"
  #  field :_NAME_, :_RETURN_TYPE_ do
  #    resolve(&_RESOLVER_FUNCTION_/2)
  #  end
  # end
  #
  # object :users_subscriptions do
  #  @desc "Description"
  #  field :_NAME_, :_RETURN_TYPE_ do
  #    trigger(:_A_MUTATION_,
  #      topic: fn _return_from_mutation ->
  #        "_TOPIC_"
  #      end
  #    )
  #
  #    config(fn _args, _info ->
  #      {:ok, topic: "_TOPIC_"}
  #    end)
  #  end
  # end
end
