defmodule Booklist.Repo.Migrations.CreateLists do
  use Ecto.Migration

  def change do
    create table(:lists) do
      add :name, :text, null: false

      timestamps()
    end

  end
end
