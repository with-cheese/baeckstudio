defmodule BsApi.Projects.WorkImage do
  use Ecto.Schema
  import Ecto.Changeset


  schema "work_images" do
    field :fileName, :string
    field :work_id, :id

    timestamps()
  end

  @doc false
  def changeset(work_image, attrs) do
    work_image
    |> cast(attrs, [:fileName])
    |> validate_required([:fileName])
  end
end
