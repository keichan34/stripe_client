# StripeClient

[![Build Status](https://travis-ci.org/keichan34/stripe_client.svg?branch=master)](https://travis-ci.org/keichan34/stripe_client)

**Warning!** This is pre-release, work-in-progress, alpha grade material.

An interface to [Stripe](https://stripe.com) for Elixir.

This library is not sponsored or supported by Stripe in any way. Please use it
at your own risk. I encourage you to review the code and test suite before using.

## Installation

  1. Add `stripe_client` to your list of dependencies in `mix.exs`:

        def deps do
          [{:stripe_client, "~> 0.0.1"}]
        end

  2. Ensure `stripe_client` is started before your application:

        def application do
          [applications: [:stripe_client]]
        end

  3. Configure StripeClient in `config.exs` (or environment equivalent):

        config :stripe_client, :adapter, StripeClient.Adapter.HTTPoison
        config :stripe_client, :credentials,
          secret_key: "secret key from Stripe",
          public_key: "public key from Stripe"

## Usage

StripeClient uses pluggable adapters to provide a robust test environment without
having to rely on mocking HTTP requests.

A shortcut is provided to return the active adapter: `StripeClient.adapter/0`.

To see the functions adapters implement, please see `StripeClient.Adapter`.

## Example

```elixir
{:ok, token} = StripeClient.adapter.token_create(card: %{
  number: "4242-4242-4242-4242",
  exp_month: "11",
  exp_year: "2017",
  cvc: "123",
  name: "EXAMPLE PERSON"
})
{:ok, customer} = StripeClient.adapter.customer_create(email: "hello@example.com", source: token)
```

## Contributing
