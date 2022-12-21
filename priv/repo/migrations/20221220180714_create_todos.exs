defmodule TodoApp.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :name, :string
      add :completed, :boolean, default: false, null: false
      add :description, :text

      timestamps()
    end
  end
end
