defmodule StripeClient.Card do
  defstruct [
    :id,
    {:object, "card"},
    :address_city,
    :address_country,
    :address_line1,
    :address_line1_check,
    :address_line2,
    :address_state,
    :address_zip,
    :address_zip_check,
    :brand,
    :country,
    :cvc_check,
    :dynamic_last4,
    :exp_month,
    :exp_year,
    :funding,
    :last4,
    :metadata,
    :name,
    :tokenization_method
  ]

  @type t :: %StripeClient.Card{}
end
