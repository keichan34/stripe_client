defmodule StripeClient.Event do
  use StripeClient

  alias StripeClient.Event

  defstruct [
    :id,
    {:object, "event"},
    :api_version,
    :created,
    :data,
    :livemode,
    :pending_webhooks,
    :request,
    :type
  ]

  @type t :: %Event{}

  def retrieve(id),
    do: adapter.event_retrieve(n_id(id))
  def all(params \\ []),
    do: adapter.event_all(params)
end
