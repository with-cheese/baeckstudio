defmodule BsApiWeb.WorkControllerTest do
  use BsApiWeb.ConnCase

  alias BsApi.Photos
  alias BsApi.Photos.Work

  @create_attrs %{description: "some description", filename: "some filename", title: "some title"}
  @update_attrs %{description: "some updated description", filename: "some updated filename", title: "some updated title"}
  @invalid_attrs %{description: nil, filename: nil, title: nil}

  def fixture(:work) do
    {:ok, work} = Photos.create_work(@create_attrs)
    work
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all works", %{conn: conn} do
      conn = get conn, work_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create work" do
    test "renders work when data is valid", %{conn: conn} do
      conn = post conn, work_path(conn, :create), work: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, work_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description",
        "filename" => "some filename",
        "title" => "some title"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, work_path(conn, :create), work: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update work" do
    setup [:create_work]

    test "renders work when data is valid", %{conn: conn, work: %Work{id: id} = work} do
      conn = put conn, work_path(conn, :update, work), work: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, work_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description",
        "filename" => "some updated filename",
        "title" => "some updated title"}
    end

    test "renders errors when data is invalid", %{conn: conn, work: work} do
      conn = put conn, work_path(conn, :update, work), work: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete work" do
    setup [:create_work]

    test "deletes chosen work", %{conn: conn, work: work} do
      conn = delete conn, work_path(conn, :delete, work)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, work_path(conn, :show, work)
      end
    end
  end

  defp create_work(_) do
    work = fixture(:work)
    {:ok, work: work}
  end
end
