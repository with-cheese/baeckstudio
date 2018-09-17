defmodule BsApiWeb.WorkImagePositionView do
  use BsApiWeb, :view
  alias BsApiWeb.WorkImagePositionView

  def render("index.json", %{work_image_positions: work_image_positions}) do
    %{data: render_many(work_image_positions, WorkImagePositionView, "work_image_position.json")}
  end

  def render("show.json", %{work_image_position: work_image_position}) do
    %{data: render_one(work_image_position, WorkImagePositionView, "work_image_position.json")}
  end

  def render("work_image_position.json", %{work_image_position: work_image_position}) do
    %{id: work_image_position.id,
      position: work_image_position.position}
  end
end
