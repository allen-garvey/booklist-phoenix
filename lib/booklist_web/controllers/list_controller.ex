defmodule BooklistWeb.ListController do
  use BooklistWeb, :controller

  alias Booklist.Admin
  alias Booklist.Admin.List

  def index(conn, _params) do
    lists = Admin.list_lists()
    render(conn, "index.html", lists: lists)
  end

  def new(conn, _params) do
    changeset = Admin.change_list(%List{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"list" => list_params}) do
    case Admin.create_list(list_params) do
      {:ok, list} ->
        conn
        |> put_flash(:info, "List created successfully.")
        |> redirect(to: Routes.list_path(conn, :show, list))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    list = Admin.get_list!(id)
    render(conn, "show.html", list: list)
  end

  def edit(conn, %{"id" => id}) do
    list = Admin.get_list!(id)
    changeset = Admin.change_list(list)
    render(conn, "edit.html", list: list, changeset: changeset)
  end

  def update(conn, %{"id" => id, "list" => list_params}) do
    list = Admin.get_list!(id)

    case Admin.update_list(list, list_params) do
      {:ok, list} ->
        conn
        |> put_flash(:info, "List updated successfully.")
        |> redirect(to: Routes.list_path(conn, :show, list))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", list: list, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    list = Admin.get_list!(id)
    {:ok, _list} = Admin.delete_list(list)

    conn
    |> put_flash(:info, "List deleted successfully.")
    |> redirect(to: Routes.list_path(conn, :index))
  end
end
