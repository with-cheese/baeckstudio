defmodule BsApiWeb.Router do
  use BsApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BsApiWeb do
    pipe_through :api
    get "/works", WorkController, :index
    get "/works/images/slides", WorkImageController, :slides
    get "/works/images/overview", WorkImageController, :overview
    get "/works/:id/images", WorkImageController, :work
  end
end
