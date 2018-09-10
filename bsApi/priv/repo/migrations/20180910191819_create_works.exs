defmodule BsApi.Repo.Migrations.CreateWorks do
  use Ecto.Migration

  def change do
    create table(:works) do
      add :filename, :string
      add :description, :string
      add :title, :string

      timestamps()
    end

  end
end
