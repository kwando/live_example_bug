defmodule LiveExampleWeb.PageController do
  use LiveExampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
