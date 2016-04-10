defmodule StripeClient.Adapter do
  @moduledoc """
  A behaviour defining the API an adapter should adhere to.
  """

  alias StripeClient.{Account, Customer, Token}

  @type http_error_code :: non_neg_integer
  @type response_body :: binary
  @type reason :: {:http_error, http_error_code, response_body} | StripeClient.Error.t

  @type id :: String.t
  @type params :: [...]

  @type delete_response :: {:ok, StripeClient.DeleteResponse} | {:error, reason}

  # Customer
  @type customer_response :: {:ok, Customer.t} | {:error, reason}

  @callback customer_create(params) :: customer_response
  @callback customer_retrieve(id) :: customer_response
  @callback customer_update(id, params) :: customer_response
  @callback customer_delete(id) :: delete_response
  @callback customer_all(params) :: {:ok, List.t} | {:error, reason}

  # Token
  @type token_response :: {:ok, Token.t} | {:error, reason}

  @callback token_create(params) :: token_response
  @callback token_retrieve(id) :: token_response

  # Account
  @type account_response :: {:ok, Account.t} | {:error, reason}

  @callback account_retrieve :: account_response
end
