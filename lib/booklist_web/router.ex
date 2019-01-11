defmodule BooklistWeb.Router do
  use BooklistWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BooklistWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/resources", PageController, :resources
    get "/bookshelf", PageController, :bookshelf

    get "/books/:book_id/locations/new", BookLocationController, :new
    get "/books/:book_id/ratings/new", RatingController, :new

    resources "/authors", AuthorController
    resources "/books", BookController
    resources "/book-locations", BookLocationController
    resources "/genres", GenreController
    resources "/libraries", LibraryController
    resources "/loans", LoanController
    resources "/locations", LocationController
    resources "/ratings", RatingController
  end

  # Other scopes may use custom stacks.
  # scope "/api", BooklistWeb do
  #   pipe_through :api
  # end
end
