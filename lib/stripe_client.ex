defmodule StripeClient do
  use Application

  @compile {:inline, adapter: 0}

  def adapter,
    do: Application.get_env(:stripe_client, :adapter, StripeClient.Adapter.HTTPoison)

  def secret_key do
    Application.get_env(:stripe_client, :credentials, [])
    |> Keyword.fetch!(:secret_key)
  end

  def memory_adapter_enabled? do
    adapter == StripeClient.Adapter.Memory ||
    Application.get_env(:stripe_client, :enable_memory_adapter, false)
  end

  def start(_type, _args) do
    StripeClient.Supervisor.start_link
  end
end
