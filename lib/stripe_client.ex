defmodule StripeClient do
  use Application

  defmacro __using__(_) do
    quote do
      import StripeClient, only: [adapter: 0]

      # Normalize "id" params
      defp n_id(%{id: id}), do: id
      defp n_id(id), do: id
    end
  end

  @compile {:inline, adapter: 0}

  @doc """
  Returns the active adapter.

  Defaults to `StripeClient.Adapter.HTTPoison`
  """
  def adapter,
    do: Application.get_env(:stripe_client, :adapter, StripeClient.Adapter.HTTPoison)

  @doc """
  Returns the currently configured Stripe secret key.

  Raises an error if it is not set.
  """
  def secret_key do
    Application.get_env(:stripe_client, :credentials, [])
    |> Keyword.fetch!(:secret_key)
  end

  @doc false
  def start(_type, _args) do
    StripeClient.Supervisor.start_link
  end
end
