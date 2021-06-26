defmodule GraphyWeb.Graphql.Types.Preferences do
  @moduledoc false
  use Absinthe.Schema.Notation

  object :preferences do
    field(:likes_emails, :boolean)
    field(:likes_phone_calls, :boolean)
  end

  # object :preferences_mutations do
  #  @desc "Update preferences for a given user id"
  #  field :_NAME_, :_RETURN_TYPE_ do
  #    resolve(&_RESOLVER_FUNCTION_/2)
  #  end
  # end
end
