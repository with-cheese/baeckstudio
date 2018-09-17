defmodule BsApiWeb.WorkTextController do
  use BsApiWeb, :controller

  alias BsApi.Projects
  alias BsApi.Projects.WorkText

  action_fallback BsApiWeb.FallbackController

  def index(conn, _params) do
    work_text = Projects.list_work_text()
    render(conn, "index.json", work_text: work_text)
  end

  def create(conn, %{"work_text" => work_text_params}) do
    with {:ok, %WorkText{} = work_text} <- Projects.create_work_text(work_text_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", work_text_path(conn, :show, work_text))
      |> render("show.json", work_text: work_text)
    end
  end

  def show(conn, %{"id" => id}) do
    work_text = Projects.get_work_text!(id)
    render(conn, "show.json", work_text: work_text)
  end

  def update(conn, %{"id" => id, "work_text" => work_text_params}) do
    work_text = Projects.get_work_text!(id)

    with {:ok, %WorkText{} = work_text} <- Projects.update_work_text(work_text, work_text_params) do
      render(conn, "show.json", work_text: work_text)
    end
  end

  def delete(conn, %{"id" => id}) do
    work_text = Projects.get_work_text!(id)
    with {:ok, %WorkText{}} <- Projects.delete_work_text(work_text) do
      send_resp(conn, :no_content, "")
    end
  end
end
