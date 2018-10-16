defmodule BsApi.Projects.WorkImage do
  use Ecto.Schema
  import Ecto.Changeset


  schema "work_images" do
    field :file_name, :string
    field :work_id, :id
    field :title, :string
    field :sub_title, :string
    field :active, :boolean

    timestamps()
  end

  @doc false
  def changeset(work_image, attrs) do
    work_image
    |> cast(attrs, [:file_name])
    |> validate_required([:file_name])
  end

end