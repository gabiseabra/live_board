defmodule LiveBoard.Repo.Migrations.AddFieldsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :avatar, :text
    end
  end
end
