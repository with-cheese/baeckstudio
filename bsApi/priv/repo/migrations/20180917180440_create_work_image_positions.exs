defmodule BsApi.Repo.Migrations.CreateWorkImagePositions do
  use Ecto.Migration

  def change do
    create table(:work_image_positions) do
      add :position, :integer
      add :work_image_id, references(:work_images, on_delete: :nothing)

      timestamps()
    end

    create index(:work_image_positions, [:work_image_id])
  end
end
