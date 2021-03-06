defmodule BsApi.Projects.Work do
  use Ecto.Schema
  import Ecto.Changeset

  schema "works" do
    field :name, :string
    field :active, :boolean
    field :type, :string
    field :info, :string
  end

  @doc false
  def changeset(work, attrs) do
    work
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

end
