defmodule DivvyBudgetElixirWeb.Router do
  use DivvyBudgetElixirWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DivvyBudgetElixirWeb do
	pipe_through :api
	resources "/categories", CategoryController, except: [:new, :edit]
	resources "/items", ItemController, except: [:new, :edit]
  end
end
