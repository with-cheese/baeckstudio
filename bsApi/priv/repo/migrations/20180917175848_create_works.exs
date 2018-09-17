defmodule BsApi.Repo.Migrations.CreateWorks do
  use Ecto.Migration

  def change do
    create table(:works) do
      add :name, :string

      timestamps()
    end

  end
end
