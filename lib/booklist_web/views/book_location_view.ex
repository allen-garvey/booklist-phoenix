defmodule BooklistWeb.BookLocationView do
  use BooklistWeb, :view

  def to_s(book_location) do
  	BooklistWeb.BookView.to_s(book_location.book) <> "—" <> BooklistWeb.LocationView.to_s(book_location.location)
  end

  @doc """
  Used for book show pages, since we only need the location with no book
  """
  def to_s_location(book_location) do
  	to_s_with_call_number(BooklistWeb.LocationView.to_s_full(book_location.location), book_location.call_number)
  end

  @doc """
  Because call_number might be nil
  """
  def to_s_with_call_number(string, nil) do
  	string
  end

  def to_s_with_call_number(string, call_number) do
  	string <> "—" <> call_number
  end
end
