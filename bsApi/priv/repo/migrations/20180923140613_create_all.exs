defmodule BsApi.Repo.Migrations.CreateAll do
  use Ecto.Migration

  def change do

    create table(:works) do
      add :name, :string
      add :active, :boolean
      timestamps()
    end

    create table(:work_images) do
      add :file_name, :string
      add :work_id, references(:works, on_delete: :nothing)
      add :title, :string
      add :sub_title, :string
      add :active, :boolean

      timestamps()
    end

    create index(:work_images, [:work_id])

    create table(:work_text) do
      add :text, :string
      add :type, :integer
      add :work_id, references(:works, on_delete: :nothing)

      timestamps()
    end

    create index(:work_text, [:work_id])

    create table(:work_image_positions) do
      add :width, :integer
      add :alignment, :string
      add :distance, :integer
      add :top, :integer

      add :work_image_id, references(:work_images, on_delete: :nothing)

      timestamps()
    end

    create index(:work_image_positions, [:work_image_id])

  end
end
