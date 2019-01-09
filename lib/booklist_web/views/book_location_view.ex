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
  Attempts to dynamically create call number not set if book is fiction and has an author with a last name
  """
  def get_call_number(nil, book) do
  	if book.is_fiction and !is_nil(book.author) and !is_nil(book.author.last_name) do
  		book.author.last_name
  	else
  		nil
  	end
  end

  def get_call_number(call_number, _book) do
  	call_number
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

  def super_search_direct_link(_library, nil) do
  	content_tag(:span, "")
  end

  def super_search_direct_link(_library, call_number) do
  	link call_number, to: "https://google.com", class: "super_search_link"
  end
end
