defmodule BsApiWeb.WorkController do
  use BsApiWeb, :controller

  alias BsApi.Projects
  alias BsApi.Projects.Work

  action_fallback BsApiWeb.FallbackController

  def index(conn, _params) do
    works = Projects.list_works()
    render(conn, "index.json", works: works)
  end

  def create(conn, %{"work" => work_params}) do
    with {:ok, %Work{} = work} <- Projects.create_work(work_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", work_path(conn, :show, work))
      |> render("show.json", work: work)
    end
  end

  def show(conn, %{"id" => id}) do
    work = Projects.get_work!(id)
    render(conn, "show.json", work: work)
  end

  def update(conn, %{"id" => id, "work" => work_params}) do
    work = Projects.get_work!(id)

    with {:ok, %Work{} = work} <- Projects.update_work(work, work_params) do
      render(conn, "show.json", work: work)
    end
  end

  def delete(conn, %{"id" => id}) do
    work = Projects.get_work!(id)
    with {:ok, %Work{}} <- Projects.delete_work(work) do
      send_resp(conn, :no_content, "")
    end
  end
end
