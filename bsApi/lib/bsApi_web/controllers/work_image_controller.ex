defmodule BsApiWeb.WorkImageController do
  use BsApiWeb, :controller

  alias BsApi.Projects
  alias BsApi.Projects.WorkImage

  action_fallback BsApiWeb.FallbackController

  def slides(conn, _params) do
    work_images = Projects.list_slides()
    render(conn, "index.json", work_images: work_images)
  end

  def create(conn, %{"work_image" => work_image_params}) do
    with {:ok, %WorkImage{} = work_image} <- Projects.create_work_image(work_image_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", work_image_path(conn, :show, work_image))
      |> render("show.json", work_image: work_image)
    end
  end

  def show(conn, %{"id" => id}) do
    work_image = Projects.get_work_image!(id)
    render(conn, "show.json", work_image: work_image)
  end

  def update(conn, %{"id" => id, "work_image" => work_image_params}) do
    work_image = Projects.get_work_image!(id)

    with {:ok, %WorkImage{} = work_image} <- Projects.update_work_image(work_image, work_image_params) do
      render(conn, "show.json", work_image: work_image)
    end
  end

  def delete(conn, %{"id" => id}) do
    work_image = Projects.get_work_image!(id)
    with {:ok, %WorkImage{}} <- Projects.delete_work_image(work_image) do
      send_resp(conn, :no_content, "")
    end
  end
end
