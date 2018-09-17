defmodule BsApi.Repo.Migrations.CreateWorkImages do
  use Ecto.Migration

  def change do
    create table(:work_images) do
      add :file_name, :string
      add :work_id, references(:works, on_delete: :nothing)

      timestamps()
    end

    create index(:work_images, [:work_id])
  end
end
