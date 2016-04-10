use Mix.Config

config :stripe_client,
  credentials: [
    secret_key: "sk_test_TEST_SECRET_KEY",
    publishable_key: "pk_test_TEST_PUBLISH_KEY"
  ]
