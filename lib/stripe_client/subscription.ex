defmodule StripeClient.Subscription do
  use StripeClient

  alias StripeClient.Subscription

  defstruct [
    :id,
    {:object, "subscription"},
    :application_fee_percent,
    :cancel_at_period_end,
    :canceled_at,
    :current_period_end,
    :current_period_start,
    :customer,
    :discount,
    :ended_at,
    :metadata,
    :plan,
    :quantity,
    :start,
    :status,
    :tax_percent,
    :trial_end,
    :trial_start
  ]

  @type t :: %Subscription{}

  def create(customer_id, params),
    do: adapter.subscription_create(n_id(customer_id), params)

  def retrieve(customer_id, id),
    do: adapter.subscription_retrieve(n_id(customer_id), n_id(id))

  def update(customer_id, id, params),
    do: adapter.subscription_update(n_id(customer_id), n_id(id), params)

  def delete(customer_id, id, params \\ []),
    do: adapter.subscription_delete(n_id(customer_id), n_id(id), params)

  def all(customer_id, params \\ []),
    do: adapter.subscription_all(n_id(customer_id), params)
end
