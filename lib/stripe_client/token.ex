defmodule StripeClient.Token do
  use StripeClient

  defstruct [
    :id,
    {:object, "token"},
    :bank_account,
    :card,
    :client_ip,
    :created,
    :livemode,
    :type,
    :used
  ]

  @type t :: %StripeClient.Token{}

  def create(params), do: adapter.token_create(params)
  def retrieve(id),   do: adapter.token_retrieve(n_id(id))
end
