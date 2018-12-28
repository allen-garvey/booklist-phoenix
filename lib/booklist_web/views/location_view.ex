defmodule BooklistWeb.LocationView do
  use BooklistWeb, :view

  def to_s(location) do
  	BooklistWeb.LibraryView.to_s(location.library) <> "—" <> location.name
  end
end
