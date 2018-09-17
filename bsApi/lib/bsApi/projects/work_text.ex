defmodule BsApi.Projects.WorkText do
  use Ecto.Schema
  import Ecto.Changeset


  schema "work_text" do
    field :text, :string
    field :type, :integer
    field :work_id, :id

    timestamps()
  end

  @doc false
  def changeset(work_text, attrs) do
    work_text
    |> cast(attrs, [:text, :type])
    |> validate_required([:text, :type])
  end
end
