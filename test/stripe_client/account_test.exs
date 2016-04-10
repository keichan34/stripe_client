defmodule StripeClient.AccountTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "retrieve/0" do
    use_cassette "stripe_client_account_retrieve" do
      assert {:ok, %StripeClient.Account{
        business_logo: nil,
        business_name: "Example Co",
        business_primary_color: nil,
        business_url: "www.example.com",
        charges_enabled: false,
        country: "JP",
        debit_negative_balances: nil,
        decline_charge_on: nil,
        default_currency: "jpy",
        details_submitted: false,
        display_name: "Example Co",
        email: "someone@example.com",
        external_accounts: nil,
        id: "acct_17BeFnGll05OtK5E",
        legal_entity: nil,
        managed: false,
        object: "account",
        product_description: nil,
        statement_descriptor: "EXAMPLE",
        support_email: "support@example.com",
        support_phone: "",
        support_url: "",
        timezone: "Asia/Tokyo",
        tos_acceptance: nil,
        transfer_schedule: nil,
        transfers_enabled: false,
        verification: nil
      }} = StripeClient.Account.retrieve
    end
  end
end
