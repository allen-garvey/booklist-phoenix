defmodule Booklist.Admin.Genre do
  use Ecto.Schema
  import Ecto.Changeset


  schema "genres" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(genre, attrs) do
    genre
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
