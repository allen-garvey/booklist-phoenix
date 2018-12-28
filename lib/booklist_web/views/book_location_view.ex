defmodule BooklistWeb.BookLocationView do
  use BooklistWeb, :view

  def to_s(book_location) do
  	BooklistWeb.BookView.to_s(book_location.book) <> "—" <> BooklistWeb.LocationView.to_s(book_location.location)
  end
end
