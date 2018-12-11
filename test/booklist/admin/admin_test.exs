defmodule Booklist.AdminTest do
  use Booklist.DataCase

  alias Booklist.Admin

  describe "genres" do
    alias Booklist.Admin.Genre

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def genre_fixture(attrs \\ %{}) do
      {:ok, genre} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admin.create_genre()

      genre
    end

    test "list_genres/0 returns all genres" do
      genre = genre_fixture()
      assert Admin.list_genres() == [genre]
    end

    test "get_genre!/1 returns the genre with given id" do
      genre = genre_fixture()
      assert Admin.get_genre!(genre.id) == genre
    end

    test "create_genre/1 with valid data creates a genre" do
      assert {:ok, %Genre{} = genre} = Admin.create_genre(@valid_attrs)
      assert genre.name == "some name"
    end

    test "create_genre/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_genre(@invalid_attrs)
    end

    test "update_genre/2 with valid data updates the genre" do
      genre = genre_fixture()
      assert {:ok, %Genre{} = genre} = Admin.update_genre(genre, @update_attrs)
      assert genre.name == "some updated name"
    end

    test "update_genre/2 with invalid data returns error changeset" do
      genre = genre_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_genre(genre, @invalid_attrs)
      assert genre == Admin.get_genre!(genre.id)
    end

    test "delete_genre/1 deletes the genre" do
      genre = genre_fixture()
      assert {:ok, %Genre{}} = Admin.delete_genre(genre)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_genre!(genre.id) end
    end

    test "change_genre/1 returns a genre changeset" do
      genre = genre_fixture()
      assert %Ecto.Changeset{} = Admin.change_genre(genre)
    end
  end

  describe "lists" do
    alias Booklist.Admin.List

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def list_fixture(attrs \\ %{}) do
      {:ok, list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admin.create_list()

      list
    end

    test "list_lists/0 returns all lists" do
      list = list_fixture()
      assert Admin.list_lists() == [list]
    end

    test "get_list!/1 returns the list with given id" do
      list = list_fixture()
      assert Admin.get_list!(list.id) == list
    end

    test "create_list/1 with valid data creates a list" do
      assert {:ok, %List{} = list} = Admin.create_list(@valid_attrs)
      assert list.name == "some name"
    end

    test "create_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_list(@invalid_attrs)
    end

    test "update_list/2 with valid data updates the list" do
      list = list_fixture()
      assert {:ok, %List{} = list} = Admin.update_list(list, @update_attrs)
      assert list.name == "some updated name"
    end

    test "update_list/2 with invalid data returns error changeset" do
      list = list_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_list(list, @invalid_attrs)
      assert list == Admin.get_list!(list.id)
    end

    test "delete_list/1 deletes the list" do
      list = list_fixture()
      assert {:ok, %List{}} = Admin.delete_list(list)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_list!(list.id) end
    end

    test "change_list/1 returns a list changeset" do
      list = list_fixture()
      assert %Ecto.Changeset{} = Admin.change_list(list)
    end
  end

  describe "authors" do
    alias Booklist.Admin.Author

    @valid_attrs %{first_name: "some first_name", last_name: "some last_name", middle_name: "some middle_name"}
    @update_attrs %{first_name: "some updated first_name", last_name: "some updated last_name", middle_name: "some updated middle_name"}
    @invalid_attrs %{first_name: nil, last_name: nil, middle_name: nil}

    def author_fixture(attrs \\ %{}) do
      {:ok, author} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admin.create_author()

      author
    end

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Admin.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Admin.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      assert {:ok, %Author{} = author} = Admin.create_author(@valid_attrs)
      assert author.first_name == "some first_name"
      assert author.last_name == "some last_name"
      assert author.middle_name == "some middle_name"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      assert {:ok, %Author{} = author} = Admin.update_author(author, @update_attrs)
      assert author.first_name == "some updated first_name"
      assert author.last_name == "some updated last_name"
      assert author.middle_name == "some updated middle_name"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_author(author, @invalid_attrs)
      assert author == Admin.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Admin.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Admin.change_author(author)
    end
  end
end
