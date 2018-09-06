defmodule BsApiWeb.PageController do
  use BsApiWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
