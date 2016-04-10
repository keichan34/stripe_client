defmodule StripeClient.Plan do
  use StripeClient

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

  @type t :: %StripeClient.Plan{}

  def create(params),     do: adapter.plan_create(params)
  def retrieve(id),       do: adapter.plan_retrieve(id)
  def update(id, params), do: adapter.plan_update(id, params)
  def delete(id),         do: adapter.plan_delete(id)
  def all(params \\ []),  do: adapter.plan_all(params)
end
