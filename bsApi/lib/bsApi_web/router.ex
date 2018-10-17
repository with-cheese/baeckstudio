defmodule BsApiWeb.Router do
  use BsApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BsApiWeb do
    pipe_through :api
    get "/works", WorkController, :index
    get "/works/images/slides", WorkImageController, :slides
    get "/works/text", WorkTextController, :index
    get "/works/image/positions", WorkImagePositionController, :index
    get "/works/:id", WorkController, :show
  end
end
