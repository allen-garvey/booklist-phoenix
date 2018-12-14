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

    resources "/authors", AuthorController
    resources "/books", BookController
    resources "/genres", GenreController
    resources "/libraries", LibraryController
    resources "/lists", ListController
    resources "/loans", LoanController
  end

  # Other scopes may use custom stacks.
  # scope "/api", BooklistWeb do
  #   pipe_through :api
  # end
end
