defmodule BooklistWeb.PageController do
  use BooklistWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def resources(conn, _params) do
  	resources_list = [
  		{"Authors", :author_path},
  		{"Books", :book_path},
  		{"Book Locations", :book_location_path},
  		{"Genres", :genre_path},
  		{"Libraries", :library_path},
  		{"Loans", :loan_path},
  		{"Locations", :location_path},
  		{"Ratings", :rating_path},
  	]

  	render(conn, "resources.html", resources: resources_list)
  end
end
