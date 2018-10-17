defmodule BsApi.Repo.Migrations.AlterWorkImage do
  use Ecto.Migration

  def change do
    alter table(:work_images) do
      add :type, :string
    end
  end
end