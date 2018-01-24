defmodule LiveBoard.Boards.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias LiveBoard.Boards.Message


  schema "messages" do
    field :content, :string

    belongs_to :user, LiveBoard.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Message{} = message, attrs) do
    message
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
