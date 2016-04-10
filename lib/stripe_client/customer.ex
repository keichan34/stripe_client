defmodule StripeClient.Customer do
  use StripeClient

  defstruct [
    :id,
    {:object, "customer"},
    :account_balance,
    :created,
    :currency,
    :default_source,
    :delinquent,
    :description,
    :discount,
    :email,
    :livemode,
    :metadata,
    :shipping,
    :sources,
    :subscriptions
  ]

  @type t :: %StripeClient.Customer{}

  def create(params),     do: adapter.customer_create(params)
  def retrieve(id),       do: adapter.customer_retrieve(id)
  def update(id, params), do: adapter.customer_update(id, params)
  def delete(id),         do: adapter.customer_delete(id)
  def all(params \\ []),  do: adapter.customer_all(params)
end
