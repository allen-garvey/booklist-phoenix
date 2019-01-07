defmodule Booklist.Admin do
  @moduledoc """
  The Admin context.
  """

  import Ecto.Query, warn: false
  alias Booklist.Repo

  alias Booklist.Admin.Genre

  @doc """
  Returns the list of genres.

  ## Examples

      iex> list_genres()
      [%Genre{}, ...]

  """
  def list_genres do
    Repo.all(from(Genre, order_by: [:name]))
  end

  @doc """
  Gets a single genre.

  Raises `Ecto.NoResultsError` if the Genre does not exist.

  ## Examples

      iex> get_genre!(123)
      %Genre{}

      iex> get_genre!(456)
      ** (Ecto.NoResultsError)

  """
  def get_genre!(id), do: Repo.get!(Genre, id)

  @doc """
  Creates a genre.

  ## Examples

      iex> create_genre(%{field: value})
      {:ok, %Genre{}}

      iex> create_genre(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_genre(attrs \\ %{}) do
    %Genre{}
    |> Genre.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a genre.

  ## Examples

      iex> update_genre(genre, %{field: new_value})
      {:ok, %Genre{}}

      iex> update_genre(genre, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_genre(%Genre{} = genre, attrs) do
    genre
    |> Genre.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Genre.

  ## Examples

      iex> delete_genre(genre)
      {:ok, %Genre{}}

      iex> delete_genre(genre)
      {:error, %Ecto.Changeset{}}

  """
  def delete_genre(%Genre{} = genre) do
    Repo.delete(genre)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking genre changes.

  ## Examples

      iex> change_genre(genre)
      %Ecto.Changeset{source: %Genre{}}

  """
  def change_genre(%Genre{} = genre) do
    Genre.changeset(genre, %{})
  end

  alias Booklist.Admin.Author

  @doc """
  Returns the list of authors.

  ## Examples

      iex> list_authors()
      [%Author{}, ...]

  """
  def list_authors do
    Repo.all(from(Author, order_by: [:last_name, :first_name, :middle_name]))
  end

  @doc """
  Gets a single author.

  Raises `Ecto.NoResultsError` if the Author does not exist.

  ## Examples

      iex> get_author!(123)
      %Author{}

      iex> get_author!(456)
      ** (Ecto.NoResultsError)

  """
  def get_author!(id), do: Repo.get!(Author, id)

  @doc """
  Creates a author.

  ## Examples

      iex> create_author(%{field: value})
      {:ok, %Author{}}

      iex> create_author(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_author(attrs \\ %{}) do
    %Author{}
    |> Author.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a author.

  ## Examples

      iex> update_author(author, %{field: new_value})
      {:ok, %Author{}}

      iex> update_author(author, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_author(%Author{} = author, attrs) do
    author
    |> Author.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Author.

  ## Examples

      iex> delete_author(author)
      {:ok, %Author{}}

      iex> delete_author(author)
      {:error, %Ecto.Changeset{}}

  """
  def delete_author(%Author{} = author) do
    Repo.delete(author)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking author changes.

  ## Examples

      iex> change_author(author)
      %Ecto.Changeset{source: %Author{}}

  """
  def change_author(%Author{} = author) do
    Author.changeset(author, %{})
  end

  alias Booklist.Admin.Book

  @doc """
  Returns the list of books.

  ## Examples

      iex> list_books()
      [%Book{}, ...]

  """
  def list_books do
    Repo.all(from(Book, order_by: [:title, :id]))
  end

  @doc """
  Returns the list of books by whether or not they are active
  """
  def list_books_active(is_active) when is_boolean(is_active) do
    Repo.all(from(b in Book, where: b.is_active == ^is_active, order_by: [:title, :id]))
  end
  @doc """
  Gets a single book.

  Raises `Ecto.NoResultsError` if the Book does not exist.

  ## Examples

      iex> get_book!(123)
      %Book{}

      iex> get_book!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book!(id), do: Repo.get!(Book, id)

  @doc """
  Creates a book.

  ## Examples

      iex> create_book(%{field: value})
      {:ok, %Book{}}

      iex> create_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book(attrs \\ %{}) do
    %Book{}
    |> Book.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book.

  ## Examples

      iex> update_book(book, %{field: new_value})
      {:ok, %Book{}}

      iex> update_book(book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book(%Book{} = book, attrs) do
    book
    |> Book.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Book.

  ## Examples

      iex> delete_book(book)
      {:ok, %Book{}}

      iex> delete_book(book)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book(%Book{} = book) do
    Repo.delete(book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book changes.

  ## Examples

      iex> change_book(book)
      %Ecto.Changeset{source: %Book{}}

  """
  def change_book(%Book{} = book) do
    Book.changeset(book, %{})
  end

  alias Booklist.Admin.Library

  @doc """
  Returns the list of libraries.

  ## Examples

      iex> list_libraries()
      [%Library{}, ...]

  """
  def list_libraries do
    Repo.all(from(Library, order_by: [:name]))
  end

  @doc """
  Gets a single library.

  Raises `Ecto.NoResultsError` if the Library does not exist.

  ## Examples

      iex> get_library!(123)
      %Library{}

      iex> get_library!(456)
      ** (Ecto.NoResultsError)

  """
  def get_library!(id), do: Repo.get!(Library, id)

  @doc """
  Creates a library.

  ## Examples

      iex> create_library(%{field: value})
      {:ok, %Library{}}

      iex> create_library(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_library(attrs \\ %{}) do
    %Library{}
    |> Library.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a library.

  ## Examples

      iex> update_library(library, %{field: new_value})
      {:ok, %Library{}}

      iex> update_library(library, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_library(%Library{} = library, attrs) do
    library
    |> Library.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Library.

  ## Examples

      iex> delete_library(library)
      {:ok, %Library{}}

      iex> delete_library(library)
      {:error, %Ecto.Changeset{}}

  """
  def delete_library(%Library{} = library) do
    Repo.delete(library)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking library changes.

  ## Examples

      iex> change_library(library)
      %Ecto.Changeset{source: %Library{}}

  """
  def change_library(%Library{} = library) do
    Library.changeset(library, %{})
  end

  alias Booklist.Admin.Loan

  @doc """
  Returns the list of loans.

  ## Examples

      iex> list_loans()
      [%Loan{}, ...]

  """
  def list_loans do
    from(l in Loan, join: library in assoc(l, :library), preload: [library: library], order_by: [:due_date, library.name])
      |> Repo.all

  end

  @doc """
  Returns a list of loans that are due soon.

  """
  def list_loans_due_soon do
    soon_date = Date.utc_today |> Date.add(7)
    
    from(l in Loan, join: library in assoc(l, :library), preload: [library: library], where: l.due_date < ^soon_date, order_by: [:due_date, library.name])
      |> Repo.all
  end

  @doc """
  Gets a single loan.

  Raises `Ecto.NoResultsError` if the Loan does not exist.

  ## Examples

      iex> get_loan!(123)
      %Loan{}

      iex> get_loan!(456)
      ** (Ecto.NoResultsError)

  """
  def get_loan!(id), do: Repo.get!(Loan, id)

  @doc """
  Creates a loan.

  ## Examples

      iex> create_loan(%{field: value})
      {:ok, %Loan{}}

      iex> create_loan(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_loan(attrs \\ %{}) do
    %Loan{}
    |> Loan.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a loan.

  ## Examples

      iex> update_loan(loan, %{field: new_value})
      {:ok, %Loan{}}

      iex> update_loan(loan, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_loan(%Loan{} = loan, attrs) do
    loan
    |> Loan.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Loan.

  ## Examples

      iex> delete_loan(loan)
      {:ok, %Loan{}}

      iex> delete_loan(loan)
      {:error, %Ecto.Changeset{}}

  """
  def delete_loan(%Loan{} = loan) do
    Repo.delete(loan)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking loan changes.

  ## Examples

      iex> change_loan(loan)
      %Ecto.Changeset{source: %Loan{}}

  """
  def change_loan(%Loan{} = loan) do
    Loan.changeset(loan, %{})
  end

  alias Booklist.Admin.Location

  @doc """
  Returns the list of locations.

  ## Examples

      iex> list_locations()
      [%Location{}, ...]

  """
  def list_locations do
    from(l in Location, join: library in assoc(l, :library), preload: [library: library], order_by: [library.name, :name])
      |> Repo.all
  end

  @doc """
  Gets a single location.

  Raises `Ecto.NoResultsError` if the Location does not exist.

  ## Examples

      iex> get_location!(123)
      %Location{}

      iex> get_location!(456)
      ** (Ecto.NoResultsError)

  """
  def get_location!(id), do: Repo.get!(Location, id)

  @doc """
  Creates a location.

  ## Examples

      iex> create_location(%{field: value})
      {:ok, %Location{}}

      iex> create_location(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_location(attrs \\ %{}) do
    %Location{}
    |> Location.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a location.

  ## Examples

      iex> update_location(location, %{field: new_value})
      {:ok, %Location{}}

      iex> update_location(location, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_location(%Location{} = location, attrs) do
    location
    |> Location.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Location.

  ## Examples

      iex> delete_location(location)
      {:ok, %Location{}}

      iex> delete_location(location)
      {:error, %Ecto.Changeset{}}

  """
  def delete_location(%Location{} = location) do
    Repo.delete(location)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking location changes.

  ## Examples

      iex> change_location(location)
      %Ecto.Changeset{source: %Location{}}

  """
  def change_location(%Location{} = location) do
    Location.changeset(location, %{})
  end

  alias Booklist.Admin.BookLocation

  @doc """
  Returns the list of book_locations.

  ## Examples

      iex> list_book_locations()
      [%BookLocation{}, ...]

  """
  def list_book_locations do
    from(b_l in BookLocation, join: location in assoc(b_l, :location), join: book in assoc(b_l, :book), preload: [location: location, book: book],  order_by: [book.title, location.name])
      |> Repo.all
  end

  @doc """
  Gets a single book_location.

  Raises `Ecto.NoResultsError` if the Book location does not exist.

  ## Examples

      iex> get_book_location!(123)
      %BookLocation{}

      iex> get_book_location!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book_location!(id), do: Repo.get!(BookLocation, id)

  @doc """
  Creates a book_location.

  ## Examples

      iex> create_book_location(%{field: value})
      {:ok, %BookLocation{}}

      iex> create_book_location(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book_location(attrs \\ %{}) do
    %BookLocation{}
    |> BookLocation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book_location.

  ## Examples

      iex> update_book_location(book_location, %{field: new_value})
      {:ok, %BookLocation{}}

      iex> update_book_location(book_location, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book_location(%BookLocation{} = book_location, attrs) do
    book_location
    |> BookLocation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a BookLocation.

  ## Examples

      iex> delete_book_location(book_location)
      {:ok, %BookLocation{}}

      iex> delete_book_location(book_location)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book_location(%BookLocation{} = book_location) do
    Repo.delete(book_location)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book_location changes.

  ## Examples

      iex> change_book_location(book_location)
      %Ecto.Changeset{source: %BookLocation{}}

  """
  def change_book_location(%BookLocation{} = book_location) do
    BookLocation.changeset(book_location, %{})
  end

  alias Booklist.Admin.Rating

  @doc """
  Returns the list of ratings.

  ## Examples

      iex> list_ratings()
      [%Rating{}, ...]

  """
  def list_ratings do
    from(r in Rating, join: book in assoc(r, :book), preload: [book: book], order_by: [book.title, :date_scored])
      |> Repo.all
  end

  @doc """
  Gets a single rating.

  Raises `Ecto.NoResultsError` if the Rating does not exist.

  ## Examples

      iex> get_rating!(123)
      %Rating{}

      iex> get_rating!(456)
      ** (Ecto.NoResultsError)

  """
  def get_rating!(id), do: Repo.get!(Rating, id)

  @doc """
  Creates a rating.

  ## Examples

      iex> create_rating(%{field: value})
      {:ok, %Rating{}}

      iex> create_rating(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rating(attrs \\ %{}) do
    %Rating{}
    |> Rating.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a rating.

  ## Examples

      iex> update_rating(rating, %{field: new_value})
      {:ok, %Rating{}}

      iex> update_rating(rating, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_rating(%Rating{} = rating, attrs) do
    rating
    |> Rating.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Rating.

  ## Examples

      iex> delete_rating(rating)
      {:ok, %Rating{}}

      iex> delete_rating(rating)
      {:error, %Ecto.Changeset{}}

  """
  def delete_rating(%Rating{} = rating) do
    Repo.delete(rating)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rating changes.

  ## Examples

      iex> change_rating(rating)
      %Ecto.Changeset{source: %Rating{}}

  """
  def change_rating(%Rating{} = rating) do
    Rating.changeset(rating, %{})
  end
end
