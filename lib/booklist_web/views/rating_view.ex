defmodule BooklistWeb.RatingView do
  use BooklistWeb, :view

  def to_s(rating) do
  	BooklistWeb.BookView.to_s(rating.book) <> "—" <> BooklistWeb.SharedView.us_formatted_date(rating.date_scored)
  end
end
