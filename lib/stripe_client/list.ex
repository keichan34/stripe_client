defmodule StripeClient.List do
  defstruct [
    {:object, "list"},
    :url,
    :has_more,
    :total_count,
    :data
  ]

  @type t :: %StripeClient.List{
    object: String.t,
    url: String.t,
    has_more: boolean,
    data: [...]
  }
end
