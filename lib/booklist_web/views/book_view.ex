defmodule BooklistWeb.BookView do
  use BooklistWeb, :view

  def to_s(book) do
  	book.title
  end

  @doc """
  Maps a list of books into tuples, used for forms
  """
  def map_for_form(books) do
    Enum.map(books, &{to_s(&1), &1.id})
  end
end
