defmodule BsApiWeb.WorkTextView do
  use BsApiWeb, :view
  alias BsApiWeb.WorkTextView

  def render("index.json", %{work_text: work_text}) do
    %{data: render_many(work_text, WorkTextView, "work_text.json")}
  end

  def render("show.json", %{work_text: work_text}) do
    %{data: render_one(work_text, WorkTextView, "work_text.json")}
  end

  def render("work_text.json", %{work_text: work_text}) do
    %{id: work_text.id,
      text: work_text.text,
      type: work_text.type}
  end
end
