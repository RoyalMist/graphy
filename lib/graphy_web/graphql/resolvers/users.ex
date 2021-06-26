defmodule GraphyWeb.Graphql.Resolvers.Users do
  @moduledoc false
  alias Graphy.UserBucket

  def get(%{id: id}, _) do
    case Bucket.list() |> Enum.find(&(&1.id == id)) do
      nil -> {:error, "unable to find a valid user"}
      user -> {:ok, user}
    end
  end

  def list(_attrs, _) do
    {:ok, Bucket.list()}
  end
end
