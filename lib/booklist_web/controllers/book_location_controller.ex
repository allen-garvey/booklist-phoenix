defmodule BooklistWeb.BookLocationController do
  use BooklistWeb, :controller

  alias Booklist.Admin
  alias Booklist.Admin.BookLocation

  def related_fields() do
    [
      books: Admin.list_books() |> BooklistWeb.BookView.map_for_form,
      locations: Admin.list_locations() |> BooklistWeb.LocationView.map_for_form,
    ]
  end

  def index(conn, _params) do
    book_locations = Admin.list_book_locations()
    render(conn, "index.html", book_locations: book_locations)
  end

  def new(conn, _params) do
    changeset = Admin.change_book_location(%BookLocation{})
    render(conn, "new.html", [changeset: changeset] ++ related_fields())
  end

  def create(conn, %{"book_location" => book_location_params}) do
    case Admin.create_book_location(book_location_params) do
      {:ok, book_location} ->
        conn
        |> put_flash(:info, "Book location created successfully.")
        |> redirect(to: Routes.book_location_path(conn, :show, book_location))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", [changeset: changeset] ++ related_fields())
    end
  end

  def show(conn, %{"id" => id}) do
    book_location = Admin.get_book_location!(id)
    render(conn, "show.html", book_location: book_location)
  end

  def edit(conn, %{"id" => id}) do
    book_location = Admin.get_book_location!(id)
    changeset = Admin.change_book_location(book_location)
    render(conn, "edit.html", [book_location: book_location, changeset: changeset] ++ related_fields())
  end

  def update(conn, %{"id" => id, "book_location" => book_location_params}) do
    book_location = Admin.get_book_location!(id)

    case Admin.update_book_location(book_location, book_location_params) do
      {:ok, book_location} ->
        conn
        |> put_flash(:info, "Book location updated successfully.")
        |> redirect(to: Routes.book_location_path(conn, :show, book_location))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", [book_location: book_location, changeset: changeset] ++ related_fields())
    end
  end

  def delete(conn, %{"id" => id}) do
    book_location = Admin.get_book_location!(id)
    {:ok, _book_location} = Admin.delete_book_location(book_location)

    conn
    |> put_flash(:info, "Book location deleted successfully.")
    |> redirect(to: Routes.book_location_path(conn, :index))
  end
end
