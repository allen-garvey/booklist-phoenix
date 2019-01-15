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
  	from(r in Rating, where: fragment("EXTRACT(year FROM ?)", r.date_scored) == ^year, select: %{count: count(r.id), average: coalesce(avg(r.score), 0)})
      |> Repo.one
  end
  @doc """
  Gets the week number and number of ratings (books read) in that week for the given year
  How to group by using alias based on:
  https://angelika.me/2016/09/10/how-to-order-by-the-result-of-select-count-in-ecto/
  """
  def get_ratings_count_by_week(year) do
  	#need to check for nil in where clause for left joins to work
	from(r in Rating, right_join: week_number in fragment("SELECT generate_series(1,53) AS week_number"), on: fragment("week_number = extract(week FROM ?)", r.date_scored), where: fragment("EXTRACT(year FROM ?)", r.date_scored) == ^year or is_nil(r.id), group_by: [fragment("week_number")], select: %{week_number: fragment("week_number"), count: count(r.id)}, order_by: [fragment("week_number")], limit: fragment("SELECT EXTRACT(WEEK FROM current_timestamp)"))
  	  |> Repo.all	
  end


end