# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pheonix_tutorial,
  ecto_repos: [PheonixTutorial.Repo]

# Configures the endpoint
config :pheonix_tutorial, PheonixTutorialWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BFB8MhgeNUjDrBKTeGNbHV957nj8PQeMwr/JiY/qSpF6cD/fZXLFT393CJXPperL",
  render_errors: [view: PheonixTutorialWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PheonixTutorial.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
