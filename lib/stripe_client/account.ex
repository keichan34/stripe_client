defmodule StripeClient.Account do
  defstruct [:id, {:object, "account"}, :business_name, :business_primary_color,
    :business_url, :charges_enabled, :country, :debit_negative_balances,
    :decline_charge_on, :default_currency, :details_submitted, :display_name,
    :email, :external_accounts, :legal_entity, :managed, :product_description,
    :statement_descriptor, :support_email, :support_phone, :support_url,
    :timezone, :tos_acceptance, :transfer_schedule, :transfers_enabled,
    :verification]

  @type t :: %StripeClient.Account{id: String.t, object: String.t}
end
