# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :divvy_budget_elixir,
  ecto_repos: [DivvyBudgetElixir.Repo]

# Configures the endpoint
config :divvy_budget_elixir, DivvyBudgetElixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "f41SEp55tR0IIiEg3k/NMm0CZfMtdBI7+xU4bPa4tzxLumcnJHa4T0t4R/3CHfgS",
  render_errors: [view: DivvyBudgetElixirWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: DivvyBudgetElixir.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
