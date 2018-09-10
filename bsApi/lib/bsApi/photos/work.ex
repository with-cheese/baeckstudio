defmodule BsApi.Photos.Work do
  use Ecto.Schema
  import Ecto.Changeset


  schema "works" do
    field :description, :string
    field :filename, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(work, attrs) do
    work
    |> cast(attrs, [:filename, :description, :title])
    |> validate_required([:filename, :description, :title])
  end
end
