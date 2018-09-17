defmodule BsApiWeb.WorkImageControllerTest do
  use BsApiWeb.ConnCase

  alias BsApi.Projects
  alias BsApi.Projects.WorkImage

  @create_attrs %{fileName: "some fileName"}
  @update_attrs %{fileName: "some updated fileName"}
  @invalid_attrs %{fileName: nil}

  def fixture(:work_image) do
    {:ok, work_image} = Projects.create_work_image(@create_attrs)
    work_image
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all work_images", %{conn: conn} do
      conn = get conn, work_image_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create work_image" do
    test "renders work_image when data is valid", %{conn: conn} do
      conn = post conn, work_image_path(conn, :create), work_image: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, work_image_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "fileName" => "some fileName"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, work_image_path(conn, :create), work_image: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update work_image" do
    setup [:create_work_image]

    test "renders work_image when data is valid", %{conn: conn, work_image: %WorkImage{id: id} = work_image} do
      conn = put conn, work_image_path(conn, :update, work_image), work_image: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, work_image_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "fileName" => "some updated fileName"}
    end

    test "renders errors when data is invalid", %{conn: conn, work_image: work_image} do
      conn = put conn, work_image_path(conn, :update, work_image), work_image: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete work_image" do
    setup [:create_work_image]

    test "deletes chosen work_image", %{conn: conn, work_image: work_image} do
      conn = delete conn, work_image_path(conn, :delete, work_image)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, work_image_path(conn, :show, work_image)
      end
    end
  end

  defp create_work_image(_) do
    work_image = fixture(:work_image)
    {:ok, work_image: work_image}
  end
end
