defmodule StripeClient.Error do
  defstruct [:type, :message, :code, :param, :decline_code]

  @type t :: %StripeClient.Error{}
end
