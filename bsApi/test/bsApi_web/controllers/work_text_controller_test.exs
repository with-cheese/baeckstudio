defmodule BsApiWeb.WorkTextControllerTest do
  use BsApiWeb.ConnCase

  alias BsApi.Projects
  alias BsApi.Projects.WorkText

  @create_attrs %{text: "some text", type: 42}
  @update_attrs %{text: "some updated text", type: 43}
  @invalid_attrs %{text: nil, type: nil}

  def fixture(:work_text) do
    {:ok, work_text} = Projects.create_work_text(@create_attrs)
    work_text
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all work_text", %{conn: conn} do
      conn = get conn, work_text_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create work_text" do
    test "renders work_text when data is valid", %{conn: conn} do
      conn = post conn, work_text_path(conn, :create), work_text: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, work_text_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "text" => "some text",
        "type" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, work_text_path(conn, :create), work_text: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update work_text" do
    setup [:create_work_text]

    test "renders work_text when data is valid", %{conn: conn, work_text: %WorkText{id: id} = work_text} do
      conn = put conn, work_text_path(conn, :update, work_text), work_text: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, work_text_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "text" => "some updated text",
        "type" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, work_text: work_text} do
      conn = put conn, work_text_path(conn, :update, work_text), work_text: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete work_text" do
    setup [:create_work_text]

    test "deletes chosen work_text", %{conn: conn, work_text: work_text} do
      conn = delete conn, work_text_path(conn, :delete, work_text)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, work_text_path(conn, :show, work_text)
      end
    end
  end

  defp create_work_text(_) do
    work_text = fixture(:work_text)
    {:ok, work_text: work_text}
  end
end
