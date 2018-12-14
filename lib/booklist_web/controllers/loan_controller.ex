defmodule BooklistWeb.LoanController do
  use BooklistWeb, :controller

  alias Booklist.Admin
  alias Booklist.Admin.Loan

  def index(conn, _params) do
    loans = Admin.list_loans()
    render(conn, "index.html", loans: loans)
  end

  def new(conn, _params) do
    changeset = Admin.change_loan(%Loan{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"loan" => loan_params}) do
    case Admin.create_loan(loan_params) do
      {:ok, loan} ->
        conn
        |> put_flash(:info, "Loan created successfully.")
        |> redirect(to: Routes.loan_path(conn, :show, loan))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    loan = Admin.get_loan!(id)
    render(conn, "show.html", loan: loan)
  end

  def edit(conn, %{"id" => id}) do
    loan = Admin.get_loan!(id)
    changeset = Admin.change_loan(loan)
    render(conn, "edit.html", loan: loan, changeset: changeset)
  end

  def update(conn, %{"id" => id, "loan" => loan_params}) do
    loan = Admin.get_loan!(id)

    case Admin.update_loan(loan, loan_params) do
      {:ok, loan} ->
        conn
        |> put_flash(:info, "Loan updated successfully.")
        |> redirect(to: Routes.loan_path(conn, :show, loan))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", loan: loan, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    loan = Admin.get_loan!(id)
    {:ok, _loan} = Admin.delete_loan(loan)

    conn
    |> put_flash(:info, "Loan deleted successfully.")
    |> redirect(to: Routes.loan_path(conn, :index))
  end
end
