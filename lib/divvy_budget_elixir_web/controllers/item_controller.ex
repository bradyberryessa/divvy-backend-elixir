defmodule DivvyBudgetElixirWeb.ItemController do
  use DivvyBudgetElixirWeb, :controller

  alias DivvyBudgetElixir.Budget
  alias DivvyBudgetElixir.Budget.Item

  action_fallback DivvyBudgetElixirWeb.FallbackController

  def index(conn, _params) do
    items = Budget.list_items()
    render(conn, "index.json", items: items)
  end

  def create(conn, %{"item" => item_params}) do
    with {:ok, %Item{} = item} <- Budget.create_item(item_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", item_path(conn, :show, item))
      |> render("show.json", item: item)
    end
  end

  def show(conn, %{"id" => id}) do
    item = Budget.get_item!(id)
    render(conn, "show.json", item: item)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Budget.get_item!(id)

    with {:ok, %Item{} = item} <- Budget.update_item(item, item_params) do
      render(conn, "show.json", item: item)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Budget.get_item!(id)
    with {:ok, %Item{}} <- Budget.delete_item(item) do
      send_resp(conn, :no_content, "")
    end
  end
end
