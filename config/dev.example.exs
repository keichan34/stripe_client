# Copy this file to `config/dev.exs` for testing.

use Mix.Config

config :stripe_client,
  credentials: [
    secret_key: "sk_test_XXX",
    publishable_key: "pk_test_XXX"
  ]
