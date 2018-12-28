defmodule BooklistWeb.LocationView do
  use BooklistWeb, :view

  def to_s_full(location) do
  	BooklistWeb.LibraryView.to_s(location.library) <> "—" <> location.name
  end

  def to_s(location) do
  	location.name
  end
end
