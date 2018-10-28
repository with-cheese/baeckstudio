defmodule BsApi.Repo.Migrations.AlterTables do
  use Ecto.Migration

  def change do
    alter table(:work_images) do
      remove :inserted_at
      remove :updated_at
    end
    alter table(:works) do
      remove :inserted_at
      remove :updated_at
      add :type, :string
      add :info, :string
    end
  end
end