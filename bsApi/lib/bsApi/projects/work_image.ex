defmodule BsApi.Projects.WorkImage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "work_images" do
    field :file_name, :string
    field :work_id, :id
    field :title, :string
    field :sub_title, :string
    field :active, :boolean
    field :type, :string
    field :position, :integer
    field :folder, :string
    field :width, :integer
    field :alignment, :string
    field :distance, :integer
    field :top, :integer
  end

  @doc false
  def changeset(work_image, attrs) do
    work_image
    |> cast(attrs, [:file_name])
    |> validate_required([:file_name])
  end

end