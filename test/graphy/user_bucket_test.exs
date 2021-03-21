defmodule Graphy.UserBucketTest do
  use ExUnit.Case
  doctest Graphy.UserBucket
  alias Graphy.UserBucket

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

  describe "List/1" do
    test "Should return the list of default users at init" do
      UserBucket.start_link(name: :default_state)
      assert UserBucket.list(:default_state) === @users
    end
  end

  describe "Add/2" do
    test "Should append a user to the list of default users" do
      new_user = %{
        id: 5,
        name: "Ray",
        email: "ray@gmail.com",
        preferences: %{
          likes_emails: false,
          likes_phone_calls: true
        }
      }

      UserBucket.start_link(name: :new_user)
      assert UserBucket.add(new_user, :new_user) === :ok
      assert UserBucket.list(:new_user) === @users ++ [new_user]
    end
  end

  describe "Remove/2" do
    test "Should remove the given user by id" do
      UserBucket.start_link(name: :remove_user)
      assert UserBucket.remove(3, :remove_user) === :ok

      assert UserBucket.list(:remove_user) ===
               [
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
                   id: 4,
                   name: "Tim",
                   email: "tim@gmail.com",
                   preferences: %{
                     likes_emails: false,
                     likes_phone_calls: false
                   }
                 }
               ]
    end
  end

  describe "Update/2" do
    test "Should update the user given as an argument" do
      to_update = %Graphy.User{
        id: 2,
        name: "Alicia",
        email: "alice@gmail.com",
        preferences: %{
          likes_emails: true,
          likes_phone_calls: true
        }
      }

      UserBucket.start_link(name: :update)
      assert UserBucket.update(to_update, :update) === :ok

      assert UserBucket.list(:update) ==
               [
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
                   name: "Alicia",
                   email: "alice@gmail.com",
                   preferences: %{
                     likes_emails: true,
                     likes_phone_calls: true
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
    end
  end
end
