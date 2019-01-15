defmodule Booklist.Reports do
  @moduledoc """
  The Reports context.
  """

  import Ecto.Query, warn: false
  alias Booklist.Repo

  alias Booklist.Admin.Rating

  @doc """
  Gets lowest rating for the year, or nil if none exists
  """
  def get_lowest_rating(year) do
    from(r in Rating, join: book in assoc(r, :book), preload: [book: book], where: fragment("EXTRACT(year FROM ?)", r.date_scored) == ^year, order_by: [asc: r.score, desc: r.id], limit: 1)
      |> Repo.one
  end

  @doc """
  Gets the top ratings for the given year up to the limit
  """
  def get_top_ratings(year, limit) do
    from(r in Rating, join: book in assoc(r, :book), preload: [book: book], where: fragment("EXTRACT(year FROM ?)", r.date_scored) == ^year, order_by: [desc: r.score, desc: r.id], limit: ^limit)
      |> Repo.all
  end

  def get_rating_statistics(year) do
  	from(r in Rating, where: fragment("EXTRACT(year FROM ?)", r.date_scored) == ^year, select: [count(r.id), avg(r.score)])
      |> Repo.one
  end
  @doc """
  Gets the week number and number of ratings (books read) in that week for the given year
  Can't limit to current week, because Elixir has not yet implemented function to get week of the year
  How to group by using alias based on:
  https://angelika.me/2016/09/10/how-to-order-by-the-result-of-select-count-in-ecto/
  """
  def get_ratings_count_by_week(year) do
	from(r in Rating, where: fragment("EXTRACT(year FROM ?)", r.date_scored) == ^year, group_by: fragment("week"), select: %{week: fragment("extract(week FROM ?) AS week", r.date_scored), count: count(r.id)}, order_by: [fragment("week")])
  	  |> Repo.all	
  end


end