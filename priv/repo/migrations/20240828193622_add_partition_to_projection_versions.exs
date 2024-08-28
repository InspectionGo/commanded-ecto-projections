defmodule Commanded.Projections.Repo.Migrations.AddPartitionToProjectionVersions do
  use Ecto.Migration

  def up do
    execute "ALTER TABLE projection_versions DROP CONSTRAINT projection_versions_pkey"

    alter table(:projection_versions) do
      modify :projection_name, :text, primary_key: true
      add :partition, :text, primary_key: true, default: ""
    end
  end

  def down do
    alter table(:projection_versions) do
      remove :partition
      modify :projection_name, :text, primary_key: true
    end
  end
end
