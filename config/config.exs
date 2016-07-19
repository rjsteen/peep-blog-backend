# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :peep_blog_backend,
  ecto_repos: [PeepBlogBackend.Repo]

# Configures the endpoint
config :peep_blog_backend, PeepBlogBackend.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tGZ/4HoSUnoU6fS5NYlADA6WOd5cg8u/6Lhh7N3oL/hcjme9foIPCc0w6967+o+8",
  render_errors: [view: PeepBlogBackend.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PeepBlogBackend.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
