defmodule BsApi.Repo.Migrations.AlterWorkImages do
  use Ecto.Migration

  def change do
    alter table(:work_images) do
      add :type, :string
    end
  end
end