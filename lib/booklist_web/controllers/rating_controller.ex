defmodule BooklistWeb.RatingController do
  use BooklistWeb, :controller

  alias Booklist.Admin
  alias Booklist.Admin.Rating

  def related_fields() do
    [
      books: Admin.list_books() |> BooklistWeb.BookView.map_for_form,
    ]
  end

  def index(conn, _params) do
    ratings = Admin.list_ratings()
    render(conn, "index.html", ratings: ratings)
  end

  def new(conn, _params) do
    changeset = Admin.change_rating(%Rating{})
    render(conn, "new.html", [changeset: changeset] ++ related_fields())
  end

  def create(conn, %{"rating" => rating_params}) do
    case Admin.create_rating(rating_params) do
      {:ok, rating} ->
        conn
        |> put_flash(:info, "Rating created successfully.")
        |> redirect(to: Routes.rating_path(conn, :show, rating))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", [changeset: changeset] ++ related_fields())
    end
  end

  def show(conn, %{"id" => id}) do
    rating = Admin.get_rating!(id)
    render(conn, "show.html", rating: rating)
  end

  def edit(conn, %{"id" => id}) do
    rating = Admin.get_rating!(id)
    changeset = Admin.change_rating(rating)
    render(conn, "edit.html", [rating: rating, changeset: changeset] ++ related_fields())
  end

  def update(conn, %{"id" => id, "rating" => rating_params}) do
    rating = Admin.get_rating!(id)

    case Admin.update_rating(rating, rating_params) do
      {:ok, rating} ->
        conn
        |> put_flash(:info, "Rating updated successfully.")
        |> redirect(to: Routes.rating_path(conn, :show, rating))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", [rating: rating, changeset: changeset] ++ related_fields())
    end
  end

  def delete(conn, %{"id" => id}) do
    rating = Admin.get_rating!(id)
    {:ok, _rating} = Admin.delete_rating(rating)

    conn
    |> put_flash(:info, "Rating deleted successfully.")
    |> redirect(to: Routes.rating_path(conn, :index))
  end
end
