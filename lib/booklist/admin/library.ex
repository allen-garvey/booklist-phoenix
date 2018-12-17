defmodule Booklist.Admin.Library do
  use Ecto.Schema
  import Ecto.Changeset


  schema "libraries" do
    field :name, :string
    field :super_search_key, :string
    field :url, :string

    has_many :locations, Booklist.Admin.Location

    timestamps()
  end

  @doc false
  def changeset(library, attrs) do
    library
    |> cast(attrs, [:name, :url, :super_search_key])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
