defmodule BsApiWeb.WorkView do
  use BsApiWeb, :view
  alias BsApiWeb.WorkView

  def render("index.json", %{works: works}) do
    %{data: render_many(works, WorkView, "work.json")}
  end

  def render("show.json", %{work: work}) do
    %{data: render_one(work, WorkView, "work.json")}
  end

  def render("work.json", %{work: work}) do
    %{id: work.id,
      name: work.name}
  end
end
