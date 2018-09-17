defmodule BsApiWeb.WorkImageView do
  use BsApiWeb, :view
  alias BsApiWeb.WorkImageView

  def render("index.json", %{work_images: work_images}) do
    %{data: render_many(work_images, WorkImageView, "work_image.json")}
  end

  def render("show.json", %{work_image: work_image}) do
    %{data: render_one(work_image, WorkImageView, "work_image.json")}
  end

  def render("work_image.json", %{work_image: work_image}) do
    %{id: work_image.id,
      file_name: work_image.file_name}
  end
end
