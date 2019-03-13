defmodule DivvyBudgetElixir.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :amount, :string
      add :categoryId, :string

      timestamps()
    end

  end
end
