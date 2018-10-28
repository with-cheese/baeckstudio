defmodule BsApiWeb.WorkImageController do
  use BsApiWeb, :controller

  alias BsApi.Projects
  alias BsApi.Projects.WorkImage

  action_fallback BsApiWeb.FallbackController

  def slides(conn, _params) do
    work_images = Projects.list_slides()
    render(conn, "index.json", work_images: work_images)
  end

  def overview(conn, _params) do
    work_images = Projects.list_overview()
    render(conn, "index.json", work_images: work_images)
  end

  def work(conn, %{"id" => work_id}) do
    work_images = Projects.list_work(work_id)
    render(conn, "index.json", work_images: work_images)
  end

end
