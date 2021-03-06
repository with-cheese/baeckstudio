# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bsApi,
  ecto_repos: [BsApi.Repo]

# Configures the endpoint
config :bsApi, BsApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Wsxvg18Kon2bUrTpDcKrkO2Z0QsnTmwrP91zQLjz4q/gAPIPgVr3dRYOYuApDs8E",
  render_errors: [view: BsApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: BsApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
