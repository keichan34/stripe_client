defmodule StripeClient.Subscription do
  use StripeClient

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

  @type t :: %StripeClient.Subscription{}

  def create(%StripeClient.Customer{id: c_id}, params),
    do: create(c_id, params)
  def create(customer_id, params),
    do: adapter.subscription_create(customer_id, params)

  def retrieve(%StripeClient.Customer{id: c_id}, id),
    do: retrieve(c_id, id)
  def retrieve(customer_id, id),
    do: adapter.subscription_retrieve(customer_id, id)

  def update(%StripeClient.Customer{id: c_id}, id, params),
    do: update(c_id, id, params)
  def update(customer_id, id, params),
    do: adapter.subscription_update(customer_id, id, params)

  def delete(%StripeClient.Customer{id: c_id}, id),
    do: delete(c_id, id)
  def delete(customer_id, id),
    do: adapter.subscription_delete(customer_id, id)

  def all(customer_or_customer_id, params \\ [])
  def all(%StripeClient.Customer{id: c_id}, params),
    do: all(c_id, params)
  def all(customer_id, params),
    do: adapter.subscription_all(customer_id, params)
end
