defmodule BsApi.Repo.Migrations.CreateWorkText do
  use Ecto.Migration

  def change do
    create table(:work_text) do
      add :text, :string
      add :type, :integer
      add :work_id, references(:works, on_delete: :nothing)

      timestamps()
    end

    create index(:work_text, [:work_id])
  end
end
