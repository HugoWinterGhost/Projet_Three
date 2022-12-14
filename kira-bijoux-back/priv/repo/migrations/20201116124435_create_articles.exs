defmodule KiraBijoux.Repo.Migrations.CreateArticles do
  use KiraBijouxWeb, :migration

  def change do
    create table(:articles) do
      add :page_id, references(:pages, [ on_delete: :delete_all, on_update: :update_all ])
      add :name, :string
      add :content, :text
      add :place, :integer

      timestamps()
    end

    create index(:articles, [:page_id])
  end
end
