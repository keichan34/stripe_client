# Copy this file to `config/dev.exs` for testing.

use Mix.Config

config :logger, level: :debug

config :stripe_client,
  credentials: [
    secret_key: "sk_test_XXX",
    publishable_key: "pk_test_XXX"
  ]
