defmodule BsApi.Projects do
  @moduledoc """
  The Projects context.
  """
  alias BsApi.Projects.Work
  alias BsApi.Projects.WorkImage

  import Ecto.Query, warn: false
  alias BsApi.Repo

  def list_works do
    Repo.all(Work)
  end

  def list_slides do
    Repo.all(from wi in WorkImage, where: wi.active == true and wi.type == "slide", order_by: [asc: wi.position], join: w in Work, on: w.id == wi.work_id, where: w.active == true )
  end

  def list_overview do
    Repo.all(from wi in WorkImage, where: wi.active == true and wi.type == "overview", order_by: [asc: wi.position], join: w in Work, on: w.id == wi.work_id, where: w.active == true )
  end

  def list_work(work_id) do
    Repo.all(from wi in WorkImage, where: wi.active == true and wi.type == "work" and wi.work_id == ^work_id, order_by: [asc: wi.position], join: w in Work, on: w.id == wi.work_id, where: w.active == true )
  end

end