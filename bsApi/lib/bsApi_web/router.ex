defmodule BsApiWeb.Router do
  use BsApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BsApiWeb do
    pipe_through :api
    get "/works", WorkController, :index
  end
end
