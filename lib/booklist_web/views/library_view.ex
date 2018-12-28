defmodule BooklistWeb.LibraryView do
  use BooklistWeb, :view

  def to_s(library) do
  	library.name
  end
end
