defmodule BooklistWeb.BookController do
  use BooklistWeb, :controller

  alias Booklist.Admin
  alias Booklist.Admin.Book

  def related_fields() do
    [
      #add empty item at start of authors since it is optional
      authors: Admin.list_authors() |> BooklistWeb.AuthorView.map_for_form |> List.insert_at(0, {"", nil}),
      genres: Admin.list_genres() |> BooklistWeb.GenreView.map_for_form,
    ]
  end

  def index(conn, %{"active" => is_active}) do
    books = Admin.list_books_active(is_active == "true")
    render(conn, "index.html", books: books)
  end

  def index(conn, %{"read" => is_read}) do
    books = Admin.list_books_read(is_read == "true")
    render(conn, "index.html", books: books)
  end

  def index(conn, _params) do
    books = Admin.list_books()
    render(conn, "index.html", books: books)
  end

  def new(conn, _params) do
    changeset = Admin.change_book(%Book{})
    render(conn, "new.html", [changeset: changeset] ++ related_fields())
  end

  def create(conn, %{"book" => book_params}) do
    case Admin.create_book(book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book created successfully.")
        |> redirect(to: Routes.book_path(conn, :show, book))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", [changeset: changeset] ++ related_fields())
    end
  end

  def show(conn, %{"id" => id}) do
    book = Admin.get_book!(id)
    render(conn, "show.html", book: book)
  end

  def edit(conn, %{"id" => id}) do
    book = Admin.get_book!(id)
    changeset = Admin.change_book(book)
    render(conn, "edit.html", [book: book, changeset: changeset] ++ related_fields())
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    book = Admin.get_book!(id)

    case Admin.update_book(book, book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book updated successfully.")
        |> redirect(to: Routes.book_path(conn, :show, book))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", [book: book, changeset: changeset] ++ related_fields())
    end
  end

  def delete(conn, %{"id" => id}) do
    book = Admin.get_book!(id)
    {:ok, _book} = Admin.delete_book(book)

    conn
    |> put_flash(:info, "Book deleted successfully.")
    |> redirect(to: Routes.book_path(conn, :index))
  end
end
