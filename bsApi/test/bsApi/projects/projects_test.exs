defmodule BsApi.ProjectsTest do
  use BsApi.DataCase

  alias BsApi.Projects

  describe "works" do
    alias BsApi.Projects.Work

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def work_fixture(attrs \\ %{}) do
      {:ok, work} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_work()

      work
    end

    test "list_works/0 returns all works" do
      work = work_fixture()
      assert Projects.list_works() == [work]
    end

    test "get_work!/1 returns the work with given id" do
      work = work_fixture()
      assert Projects.get_work!(work.id) == work
    end

    test "create_work/1 with valid data creates a work" do
      assert {:ok, %Work{} = work} = Projects.create_work(@valid_attrs)
      assert work.name == "some name"
    end

    test "create_work/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_work(@invalid_attrs)
    end

    test "update_work/2 with valid data updates the work" do
      work = work_fixture()
      assert {:ok, work} = Projects.update_work(work, @update_attrs)
      assert %Work{} = work
      assert work.name == "some updated name"
    end

    test "update_work/2 with invalid data returns error changeset" do
      work = work_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_work(work, @invalid_attrs)
      assert work == Projects.get_work!(work.id)
    end

    test "delete_work/1 deletes the work" do
      work = work_fixture()
      assert {:ok, %Work{}} = Projects.delete_work(work)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_work!(work.id) end
    end

    test "change_work/1 returns a work changeset" do
      work = work_fixture()
      assert %Ecto.Changeset{} = Projects.change_work(work)
    end
  end

  describe "work_images" do
    alias BsApi.Projects.WorkImage

    @valid_attrs %{fileName: "some fileName"}
    @update_attrs %{fileName: "some updated fileName"}
    @invalid_attrs %{fileName: nil}

    def work_image_fixture(attrs \\ %{}) do
      {:ok, work_image} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_work_image()

      work_image
    end

    test "list_work_images/0 returns all work_images" do
      work_image = work_image_fixture()
      assert Projects.list_work_images() == [work_image]
    end

    test "get_work_image!/1 returns the work_image with given id" do
      work_image = work_image_fixture()
      assert Projects.get_work_image!(work_image.id) == work_image
    end

    test "create_work_image/1 with valid data creates a work_image" do
      assert {:ok, %WorkImage{} = work_image} = Projects.create_work_image(@valid_attrs)
      assert work_image.fileName == "some fileName"
    end

    test "create_work_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_work_image(@invalid_attrs)
    end

    test "update_work_image/2 with valid data updates the work_image" do
      work_image = work_image_fixture()
      assert {:ok, work_image} = Projects.update_work_image(work_image, @update_attrs)
      assert %WorkImage{} = work_image
      assert work_image.fileName == "some updated fileName"
    end

    test "update_work_image/2 with invalid data returns error changeset" do
      work_image = work_image_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_work_image(work_image, @invalid_attrs)
      assert work_image == Projects.get_work_image!(work_image.id)
    end

    test "delete_work_image/1 deletes the work_image" do
      work_image = work_image_fixture()
      assert {:ok, %WorkImage{}} = Projects.delete_work_image(work_image)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_work_image!(work_image.id) end
    end

    test "change_work_image/1 returns a work_image changeset" do
      work_image = work_image_fixture()
      assert %Ecto.Changeset{} = Projects.change_work_image(work_image)
    end
  end

  describe "work_text" do
    alias BsApi.Projects.WorkText

    @valid_attrs %{text: "some text", type: 42}
    @update_attrs %{text: "some updated text", type: 43}
    @invalid_attrs %{text: nil, type: nil}

    def work_text_fixture(attrs \\ %{}) do
      {:ok, work_text} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_work_text()

      work_text
    end

    test "list_work_text/0 returns all work_text" do
      work_text = work_text_fixture()
      assert Projects.list_work_text() == [work_text]
    end

    test "get_work_text!/1 returns the work_text with given id" do
      work_text = work_text_fixture()
      assert Projects.get_work_text!(work_text.id) == work_text
    end

    test "create_work_text/1 with valid data creates a work_text" do
      assert {:ok, %WorkText{} = work_text} = Projects.create_work_text(@valid_attrs)
      assert work_text.text == "some text"
      assert work_text.type == 42
    end

    test "create_work_text/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_work_text(@invalid_attrs)
    end

    test "update_work_text/2 with valid data updates the work_text" do
      work_text = work_text_fixture()
      assert {:ok, work_text} = Projects.update_work_text(work_text, @update_attrs)
      assert %WorkText{} = work_text
      assert work_text.text == "some updated text"
      assert work_text.type == 43
    end

    test "update_work_text/2 with invalid data returns error changeset" do
      work_text = work_text_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_work_text(work_text, @invalid_attrs)
      assert work_text == Projects.get_work_text!(work_text.id)
    end

    test "delete_work_text/1 deletes the work_text" do
      work_text = work_text_fixture()
      assert {:ok, %WorkText{}} = Projects.delete_work_text(work_text)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_work_text!(work_text.id) end
    end

    test "change_work_text/1 returns a work_text changeset" do
      work_text = work_text_fixture()
      assert %Ecto.Changeset{} = Projects.change_work_text(work_text)
    end
  end

  describe "work_image_positions" do
    alias BsApi.Projects.WorkImagePosition

    @valid_attrs %{position: 42}
    @update_attrs %{position: 43}
    @invalid_attrs %{position: nil}

    def work_image_position_fixture(attrs \\ %{}) do
      {:ok, work_image_position} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_work_image_position()

      work_image_position
    end

    test "list_work_image_positions/0 returns all work_image_positions" do
      work_image_position = work_image_position_fixture()
      assert Projects.list_work_image_positions() == [work_image_position]
    end

    test "get_work_image_position!/1 returns the work_image_position with given id" do
      work_image_position = work_image_position_fixture()
      assert Projects.get_work_image_position!(work_image_position.id) == work_image_position
    end

    test "create_work_image_position/1 with valid data creates a work_image_position" do
      assert {:ok, %WorkImagePosition{} = work_image_position} = Projects.create_work_image_position(@valid_attrs)
      assert work_image_position.position == 42
    end

    test "create_work_image_position/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_work_image_position(@invalid_attrs)
    end

    test "update_work_image_position/2 with valid data updates the work_image_position" do
      work_image_position = work_image_position_fixture()
      assert {:ok, work_image_position} = Projects.update_work_image_position(work_image_position, @update_attrs)
      assert %WorkImagePosition{} = work_image_position
      assert work_image_position.position == 43
    end

    test "update_work_image_position/2 with invalid data returns error changeset" do
      work_image_position = work_image_position_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_work_image_position(work_image_position, @invalid_attrs)
      assert work_image_position == Projects.get_work_image_position!(work_image_position.id)
    end

    test "delete_work_image_position/1 deletes the work_image_position" do
      work_image_position = work_image_position_fixture()
      assert {:ok, %WorkImagePosition{}} = Projects.delete_work_image_position(work_image_position)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_work_image_position!(work_image_position.id) end
    end

    test "change_work_image_position/1 returns a work_image_position changeset" do
      work_image_position = work_image_position_fixture()
      assert %Ecto.Changeset{} = Projects.change_work_image_position(work_image_position)
    end
  end
end
