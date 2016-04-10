defmodule StripeClient.Error do
  defstruct [:type, :message, :code, :param]

  @type t :: %StripeClient.Error{}
end
