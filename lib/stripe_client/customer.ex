defmodule StripeClient.Customer do
  use StripeClient

  alias StripeClient.Customer

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

  @type t :: %Customer{}

  def create(params),
    do: adapter.customer_create(params)

  def retrieve(id),
    do: adapter.customer_retrieve(n_id(id))

  def update(id, params),
    do: adapter.customer_update(n_id(id), params)

  def delete(id),
    do: adapter.customer_delete(n_id(id))

  def all(params \\ []),
    do: adapter.customer_all(params)
end
