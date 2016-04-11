defmodule StripeClient.Plan do
  use StripeClient

  alias StripeClient.Plan

  defstruct [
    :id,
    {:object, "plan"},
    :amount,
    :created,
    :currency,
    :interval,
    :interval_count,
    :livemode,
    :metadata,
    :name,
    :statement_descriptor,
    :trial_period_days
  ]

  @type t :: %Plan{}

  def create(params),
    do: adapter.plan_create(params)

  def retrieve(id),
    do: adapter.plan_retrieve(n_id(id))

  def update(id, params),
    do: adapter.plan_update(n_id(id), params)

  def delete(id),
    do: adapter.plan_delete(n_id(id))

  def all(params \\ []),
    do: adapter.plan_all(params)
end
