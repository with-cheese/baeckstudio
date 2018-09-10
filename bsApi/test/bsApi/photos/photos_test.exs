defmodule BsApi.PhotosTest do
  use BsApi.DataCase

  alias BsApi.Photos

  describe "works" do
    alias BsApi.Photos.Work

    @valid_attrs %{description: "some description", filename: "some filename", title: "some title"}
    @update_attrs %{description: "some updated description", filename: "some updated filename", title: "some updated title"}
    @invalid_attrs %{description: nil, filename: nil, title: nil}

    def work_fixture(attrs \\ %{}) do
      {:ok, work} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Photos.create_work()

      work
    end

    test "list_works/0 returns all works" do
      work = work_fixture()
      assert Photos.list_works() == [work]
    end

    test "get_work!/1 returns the work with given id" do
      work = work_fixture()
      assert Photos.get_work!(work.id) == work
    end

    test "create_work/1 with valid data creates a work" do
      assert {:ok, %Work{} = work} = Photos.create_work(@valid_attrs)
      assert work.description == "some description"
      assert work.filename == "some filename"
      assert work.title == "some title"
    end

    test "create_work/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Photos.create_work(@invalid_attrs)
    end

    test "update_work/2 with valid data updates the work" do
      work = work_fixture()
      assert {:ok, work} = Photos.update_work(work, @update_attrs)
      assert %Work{} = work
      assert work.description == "some updated description"
      assert work.filename == "some updated filename"
      assert work.title == "some updated title"
    end

    test "update_work/2 with invalid data returns error changeset" do
      work = work_fixture()
      assert {:error, %Ecto.Changeset{}} = Photos.update_work(work, @invalid_attrs)
      assert work == Photos.get_work!(work.id)
    end

    test "delete_work/1 deletes the work" do
      work = work_fixture()
      assert {:ok, %Work{}} = Photos.delete_work(work)
      assert_raise Ecto.NoResultsError, fn -> Photos.get_work!(work.id) end
    end

    test "change_work/1 returns a work changeset" do
      work = work_fixture()
      assert %Ecto.Changeset{} = Photos.change_work(work)
    end
  end
end
