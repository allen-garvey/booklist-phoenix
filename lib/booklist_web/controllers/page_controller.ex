defmodule BooklistWeb.PageController do
  use BooklistWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
