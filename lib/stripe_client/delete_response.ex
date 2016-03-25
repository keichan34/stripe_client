defmodule StripeClient.DeleteResponse do
  defstruct [:id, :deleted]

  @type t :: %StripeClient.DeleteResponse{id: String.t, deleted: boolean}
end
