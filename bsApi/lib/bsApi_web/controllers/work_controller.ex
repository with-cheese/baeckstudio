defmodule BsApiWeb.WorkController do
  use BsApiWeb, :controller

  alias BsApi.Projects
  alias BsApi.Projects.Work

  action_fallback BsApiWeb.FallbackController

  def index(conn, _params) do
    works = Projects.list_works()
    render(conn, "index.json", works: works)
  end

end
