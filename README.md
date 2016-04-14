# StripeClient

[![Build Status](https://travis-ci.org/keichan34/stripe_client.svg?branch=master)](https://travis-ci.org/keichan34/stripe_client)

**Warning!** This is pre-release, work-in-progress, alpha grade material.

An interface to [Stripe](https://stripe.com) for Elixir.

This library is not sponsored or supported by Stripe in any way. Please use it
at your own risk. I encourage you to review the code and test suite before using.

## Installation

  1. Add `stripe_client` to your list of dependencies in `mix.exs`:

        def deps do
          [{:stripe_client, "~> 0.0.3"}]
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

StripeClient uses a pluggable adapter framework. Currently it only ships with
a `HTTPoison`-based adapter. A memory test server adapter is planned in the
future in order to provide a robust test environment without having to rely
on mocking HTTP requests.

Stripe resources are represented as Elixir structs. Currently, the following
resources are implemented:

- [x] `account`: `StripeClient.Account`
- [x] `card`: `StripeClient.Card`
- [x] `customer`: `StripeClient.Customer`
- [x] `event`: `StripeClient.Event`
- [x] `list`: `StripeClient.List`
- [x] `plan`: `StripeClient.Plan`
- [x] `subscription`: `StripeClient.Subscription`
- [x] `token`: `StripeClient.Token`

## Example

```elixir
{:ok, token} = StripeClient.Token.create(%{
  "card[number]" => "4242-4242-4242-4242",
  "card[exp_month]" => "11",
  "card[exp_year]" => "2017",
  "card[cvc]" => "123",
  "card[name]" => "EXAMPLE PERSON"
})
{:ok, customer} = StripeClient.Customer.create(
  email: "hello@example.com",
  source: token.id
)
```

## Contributing
