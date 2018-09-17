defmodule BsApiWeb.WorkImagePositionControllerTest do
  use BsApiWeb.ConnCase

  alias BsApi.Projects
  alias BsApi.Projects.WorkImagePosition

  @create_attrs %{position: 42}
  @update_attrs %{position: 43}
  @invalid_attrs %{position: nil}

  def fixture(:work_image_position) do
    {:ok, work_image_position} = Projects.create_work_image_position(@create_attrs)
    work_image_position
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all work_image_positions", %{conn: conn} do
      conn = get conn, work_image_position_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create work_image_position" do
    test "renders work_image_position when data is valid", %{conn: conn} do
      conn = post conn, work_image_position_path(conn, :create), work_image_position: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, work_image_position_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "position" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, work_image_position_path(conn, :create), work_image_position: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update work_image_position" do
    setup [:create_work_image_position]

    test "renders work_image_position when data is valid", %{conn: conn, work_image_position: %WorkImagePosition{id: id} = work_image_position} do
      conn = put conn, work_image_position_path(conn, :update, work_image_position), work_image_position: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, work_image_position_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "position" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, work_image_position: work_image_position} do
      conn = put conn, work_image_position_path(conn, :update, work_image_position), work_image_position: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete work_image_position" do
    setup [:create_work_image_position]

    test "deletes chosen work_image_position", %{conn: conn, work_image_position: work_image_position} do
      conn = delete conn, work_image_position_path(conn, :delete, work_image_position)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, work_image_position_path(conn, :show, work_image_position)
      end
    end
  end

  defp create_work_image_position(_) do
    work_image_position = fixture(:work_image_position)
    {:ok, work_image_position: work_image_position}
  end
end
