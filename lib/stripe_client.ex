defmodule StripeClient do
  use Application

  defmacro __using__(_) do
    quote do
      import StripeClient, only: [adapter: 0]
    end
  end

  @compile {:inline, adapter: 0}

  def adapter,
    do: Application.get_env(:stripe_client, :adapter, StripeClient.Adapter.HTTPoison)

  def secret_key do
    Application.get_env(:stripe_client, :credentials, [])
    |> Keyword.fetch!(:secret_key)
  end

  def start(_type, _args) do
    StripeClient.Supervisor.start_link
  end
end
