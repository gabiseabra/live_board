defmodule LiveBoard.Boards.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias LiveBoard.Boards.Message


  schema "messages" do
    field :content, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Message{} = message, attrs) do
    message
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
