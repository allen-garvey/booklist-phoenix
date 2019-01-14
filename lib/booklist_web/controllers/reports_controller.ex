defmodule BooklistWeb.ReportsController do
  use BooklistWeb, :controller

  alias Booklist.Reports


  def show(conn, %{"year" => year_raw}) do
    year = String.to_integer(year_raw)
    rating_stats = Reports.get_rating_statistics(year)
    lowest_rating = Reports.get_lowest_rating(year)
    top_ratings = Reports.get_top_ratings(year, 10)
    highest_rating = case Enum.fetch(top_ratings, 0) do
      {:ok, rating} -> rating
      _             -> nil
    end


    render(conn, "show.html", year: year, rating_stats: rating_stats, lowest_rating: lowest_rating, highest_rating: highest_rating, top_ratings: top_ratings)
  end

  
end
