defmodule BsApiWeb.Router do
  use BsApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BsApiWeb do
    pipe_through :api
    get "/works", WorkController, :index
    get "/works/:id", WorkController, :show
    get "/works/images", WorkImageController, :index
    get "/works/text", WorkTextController, :index
    get "/works/image/positions", WorkImagePositionController, :index
  end
end
