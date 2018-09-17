defmodule BsApi.Projects.WorkImagePosition do
  use Ecto.Schema
  import Ecto.Changeset


  schema "work_image_positions" do
    field :position, :integer
    field :work_image_id, :id

    timestamps()
  end

  @doc false
  def changeset(work_image_position, attrs) do
    work_image_position
    |> cast(attrs, [:position])
    |> validate_required([:position])
  end
end
