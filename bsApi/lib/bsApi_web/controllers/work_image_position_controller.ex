defmodule BsApiWeb.WorkImagePositionController do
  use BsApiWeb, :controller

  alias BsApi.Projects
  alias BsApi.Projects.WorkImagePosition

  action_fallback BsApiWeb.FallbackController

  def index(conn, _params) do
    work_image_positions = Projects.list_work_image_positions()
    render(conn, "index.json", work_image_positions: work_image_positions)
  end

  def create(conn, %{"work_image_position" => work_image_position_params}) do
    with {:ok, %WorkImagePosition{} = work_image_position} <- Projects.create_work_image_position(work_image_position_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", work_image_position_path(conn, :show, work_image_position))
      |> render("show.json", work_image_position: work_image_position)
    end
  end

  def show(conn, %{"id" => id}) do
    work_image_position = Projects.get_work_image_position!(id)
    render(conn, "show.json", work_image_position: work_image_position)
  end

  def update(conn, %{"id" => id, "work_image_position" => work_image_position_params}) do
    work_image_position = Projects.get_work_image_position!(id)

    with {:ok, %WorkImagePosition{} = work_image_position} <- Projects.update_work_image_position(work_image_position, work_image_position_params) do
      render(conn, "show.json", work_image_position: work_image_position)
    end
  end

  def delete(conn, %{"id" => id}) do
    work_image_position = Projects.get_work_image_position!(id)
    with {:ok, %WorkImagePosition{}} <- Projects.delete_work_image_position(work_image_position) do
      send_resp(conn, :no_content, "")
    end
  end
end
