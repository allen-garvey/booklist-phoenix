defmodule Booklist.Repo.Migrations.CreateGenres do
  use Ecto.Migration

  def change do
    create table(:genres) do
      add :name, :text, null: false

      timestamps()
    end

  end
end
