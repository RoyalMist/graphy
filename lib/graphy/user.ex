defmodule Graphy.User do
  @moduledoc """
  Represents a user struct.
  """

  @type t :: %Graphy.User{
          id: integer(),
          name: String.t(),
          email: String.t(),
          preferences: %{
            likes_emails: boolean(),
            likes_phone_calls: boolean()
          }
        }

  @enforce_keys [:id, :name, :email, :preferences]
  defstruct [:id, :name, :email, :preferences]
end
