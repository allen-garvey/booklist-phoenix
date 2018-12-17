defmodule Booklist.Admin.Location do
  use Ecto.Schema
  import Ecto.Changeset


  schema "locations" do
    field :name, :string

    belongs_to :library, Booklist.Admin.Library

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:name, :library_id])
    |> validate_required([:name, :library_id])
    |> assoc_constraint(:library)
  end
end
