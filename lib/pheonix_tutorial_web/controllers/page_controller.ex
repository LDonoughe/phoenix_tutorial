defmodule PheonixTutorialWeb.PageController do
  use PheonixTutorialWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
