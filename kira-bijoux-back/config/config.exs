# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :kira_bijoux,
  ecto_repos: [KiraBijoux.Repo]

# Configures the endpoint
config :kira_bijoux, KiraBijouxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
  render_errors: [view: KiraBijouxWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: KiraBijoux.PubSub,
  live_view: [signing_salt: "t1Teu373"]

# Configures the Swagger
config :kira_bijoux, :phoenix_swagger,
  swagger_files: %{
    "priv/static/swagger.json" => [
      router: KiraBijouxWeb.Router,
      endpoint: KiraBijouxWeb.Endpoint
    ]
  }

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Use Jason for JSON parsing in Swagger
config :phoenix_swagger, json_library: Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
