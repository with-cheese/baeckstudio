defmodule BsApi.Repo.Migrations.AlterWorkImages do
  use Ecto.Migration

  def change do
    alter table(:work_images) do
      add :position, :integer
      add :folder, :string
      add :width, :integer
      add :alignment, :string
      add :distance, :integer
      add :top, :integer
    end
    drop table(:work_text)
    drop table(:work_image_positions)
  end
end