defmodule LiveBoard.Accounts.User do
  require Logger
  use Ecto.Schema
  import Ecto.Changeset
  alias LiveBoard.Accounts.User
  alias LiveBoard.Accounts.User.Avatar


  schema "users" do
    field :name, :string
    field :avatar, :string

    has_many :messages, LiveBoard.Boards.Message

    timestamps()
  end

  @doc false
  def changeset(user, attrs, state \\ :update)
  def changeset(%User{} = user, attrs, :create) do
    user
    |> changeset(attrs)
    |> put_avatar()
  end
  def changeset(%User{} = user, attrs, _state) do
    user
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  defp put_avatar(changeset) do
    with {:ok, filename} <- Avatar.fetch(changeset.data) do
      put_change(changeset, :avatar, filename)
    else
      {:error, type} -> %{
        changeset |
        errors: changeset.errors ++ [avatar: {type, []}],
        valid?: false
      }
    end
  end
end
