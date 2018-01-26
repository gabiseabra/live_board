# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :live_board,
  ecto_repos: [LiveBoard.Repo],
  uploads_dir: "uploads",
  avatar_api_url: "https://source.unsplash.com/200x200/?dog"

# Configures the endpoint
config :live_board, LiveBoardWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QsOFcORbRLnHoy6gEhw4QxeZbG5AXPEEI+NnSewE7Z+0YC7o11EJyd3xMkGS3ZZ7",
  render_errors: [view: LiveBoardWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: LiveBoard.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "live_board",
  verify_issuer: true,
  ttl: { 30, :days },
  secret_key: "8PLI+ulPagwyZZ36WBLJNgdAUgvUIzYzNMKOyQq2i0wIRXTIE5AibnVczkNNlPIs",
  serializer: LiveBoard.GuardianSerializer

config :arc,
  storage: Arc.Storage.Local,
  storage_dir: "priv/uploads"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
