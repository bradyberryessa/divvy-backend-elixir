defmodule DivvyBudgetElixir.Budget.Item do
  use Ecto.Schema
  import Ecto.Changeset


  schema "items" do
    field :amount, :string
    field :categoryId, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :categoryId, :amount])
    |> validate_required([:name, :categoryId, :amount])
  end
end
