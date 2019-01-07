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

  @doc """
  Path for active books 
  """
  def active_book_path(conn) do
    BooklistWeb.Router.Helpers.book_path(conn, :index, active: "true")
  end

  @doc """
  Path for active books that are unread (i.e. have no ratings)
  """
  def active_unread_book_path(conn) do
    BooklistWeb.Router.Helpers.book_path(conn, :index, active: "true", read: "false")
  end

  @doc """
  Path for inactive books that are unread (i.e. have no ratings)
  """
  def inactive_unread_book_path(conn) do
    BooklistWeb.Router.Helpers.book_path(conn, :index, active: "false", read: "false")
  end

  @doc """
  Path for inactive books that have been read (i.e. have ratings)
  """
  def inactive_read_book_path(conn) do
    BooklistWeb.Router.Helpers.book_path(conn, :index, active: "false", read: "true")
  end
end
