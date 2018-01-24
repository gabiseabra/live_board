defmodule LiveBoard.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :user_id, references(:users, on_delete: :nothing)
      add :content, :text

      timestamps()
    end

    create index(:messages, [:user_id])
  end
end
