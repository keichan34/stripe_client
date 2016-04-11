defmodule StripeClient.Adapter do
  @moduledoc false

  @type http_error_code :: non_neg_integer
  @type response_body :: binary
  @type reason :: {:http_error, http_error_code, response_body} | StripeClient.Error.t

  @type id :: String.t
  @type params :: [...]

  @type delete_response :: {:ok, StripeClient.DeleteResponse} | {:error, reason}
  @type list_response :: {:ok, List.t} | {:error, reason}

  # Customer
  @type customer_response :: {:ok, StripeClient.Customer.t} | {:error, reason}

  @callback customer_create(params) :: customer_response
  @callback customer_retrieve(id) :: customer_response
  @callback customer_update(id, params) :: customer_response
  @callback customer_delete(id) :: delete_response
  @callback customer_all(params) :: list_response

  # Plan
  @type plan_response :: {:ok, Plan.t} | {:error, reason}

  @callback plan_create(params) :: plan_response
  @callback plan_retrieve(id) :: plan_response
  @callback plan_update(id, params) :: plan_response
  @callback plan_delete(id) :: delete_response
  @callback plan_all(params) :: list_response

  # Subscription
  @type subscription_response :: {:ok, StripeClient.Subscription.t} | {:error, reason}

  @callback subscription_create(id, params) :: subscription_response
  @callback subscription_retrieve(id, id) :: subscription_response
  @callback subscription_update(id, id, params) :: subscription_response
  @callback subscription_delete(id, id, params) :: delete_response
  @callback subscription_all(id, params) :: list_response

  # Token
  @type token_response :: {:ok, StripeClient.Token.t} | {:error, reason}

  @callback token_create(params) :: token_response
  @callback token_retrieve(id) :: token_response

  # Account
  @type account_response :: {:ok, StripeClient.Account.t} | {:error, reason}

  @callback account_retrieve :: account_response
end
