defmodule BooklistWeb.GenreView do
  use BooklistWeb, :view

  def to_s(genre) do
  	genre.name
  end
end
