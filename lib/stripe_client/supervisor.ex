defmodule StripeClient.Supervisor do
  @moduledoc false

  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_opts) do
    children = [
    ]

    supervise(children, strategy: :one_for_one)
  end
end
