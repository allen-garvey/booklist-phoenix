defmodule Booklist.Admin.Book do
  use Ecto.Schema
  import Ecto.Changeset


  schema "books" do
    field :is_fiction, :boolean, default: false
    field :sort_title, :string
    field :subtitle, :string
    field :title, :string

    belongs_to :author, Booklist.Admin.Author
    belongs_to :genre, Booklist.Admin.Genre

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :sort_title, :subtitle, :is_fiction, :genre_id, :author_id])
    |> validate_required([:title, :sort_title, :is_fiction, :genre_id])
    |> assoc_constraint(:author)
    |> assoc_constraint(:genre)
  end
end
