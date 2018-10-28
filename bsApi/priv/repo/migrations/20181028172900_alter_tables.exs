defmodule BsApi.Repo.Migrations.AlterTables do
  use Ecto.Migration

  def change do
    alter table(:works) do
      remove :info
      add :info, :text
    end
  end
end