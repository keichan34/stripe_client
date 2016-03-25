defmodule StripeClient.List do
  defstruct [{:object, "list"}, :url, :has_more, :data]

  @type t :: %StripeClient.List{object: "list", url: String.t,
    has_more: boolean, data: [...]}
end
