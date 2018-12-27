defmodule BooklistWeb.BookView do
  use BooklistWeb, :view

  def to_s(book) do
  	book.title
  end
end
