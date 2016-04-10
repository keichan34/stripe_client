use Mix.Config

config :stripe_client,
  credentials: [
    secret_key: "sk_test_TEST_SECRET_KEY",
    publishable_key: "pk_test_TEST_PUBLISH_KEY"
  ]

config :exvcr, [
  vcr_cassette_library_dir: "fixture/vcr_cassettes",
  filter_sensitive_data: [],
  filter_url_params: false,
  response_headers_blacklist: []
]

try do
  import_config "test.secret.exs"
rescue
  _ -> nil
end
