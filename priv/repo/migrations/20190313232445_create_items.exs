defmodule DivvyBudgetElixir.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :categoryId, :string
      add :amount, :string

      timestamps()
    end

  end
end
