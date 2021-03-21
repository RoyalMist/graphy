defmodule Graphy.UserBucket do
  @moduledoc """
  User storage with an Agent.
  """
  use Agent
  require Logger

  @users [
    %Graphy.User{
      id: 1,
      name: "Bill",
      email: "bill@gmail.com",
      preferences: %{
        likes_emails: false,
        likes_phone_calls: true
      }
    },
    %Graphy.User{
      id: 2,
      name: "Alice",
      email: "alice@gmail.com",
      preferences: %{
        likes_emails: true,
        likes_phone_calls: false
      }
    },
    %Graphy.User{
      id: 3,
      name: "Jill",
      email: "jill@hotmail.com",
      preferences: %{
        likes_emails: true,
        likes_phone_calls: true
      }
    },
    %Graphy.User{
      id: 4,
      name: "Tim",
      email: "tim@gmail.com",
      preferences: %{
        likes_emails: false,
        likes_phone_calls: false
      }
    }
  ]

  @spec start_link(Keyword.t()) :: {:error, any} | {:ok, pid}
  def start_link(opts \\ []) do
    Logger.info("Starting the user's bucket")
    opts = Keyword.put_new(opts, :name, __MODULE__)
    Agent.start_link(fn -> @users end, opts)
  end

  @spec list(atom | pid | {atom, any} | {:via, atom, any}) :: [Graphy.User.t()]
  def list(name \\ __MODULE__) do
    Agent.get(name, & &1)
  end

  @spec add(Graphy.User.t(), atom | pid | {atom, any} | {:via, atom, any}) :: :ok
  def add(user, name \\ __MODULE__) do
    Agent.update(name, fn users ->
      [user | Enum.reverse(users)] |> Enum.reverse()
    end)
  end

  @spec remove(integer, atom | pid | {atom, any} | {:via, atom, any}) :: :ok
  def remove(id, name \\ __MODULE__) do
    Agent.update(name, fn users -> Enum.filter(users, &(&1.id !== id)) end)
  end

  @spec update(Graphy.User.t(), atom | pid | {atom, any} | {:via, atom, any}) :: :ok
  def update(user, name \\ __MODULE__) do
    Agent.update(name, fn users ->
      Enum.map(users, fn u ->
        if u.id === user.id do
          user
        else
          u
        end
      end)
    end)
  end
end
