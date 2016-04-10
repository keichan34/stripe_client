defmodule StripeClient.Adapter.HTTPoison do
  @moduledoc """
  The HTTPoison adapter for StripeClient.
  """

  @behaviour StripeClient.Adapter

  alias StripeClient.Adapter.HTTPoison.ResponseParser

  @uri_base "https://api.stripe.com/v1"
  @api_version "2016-03-07"

  def customer_create(params),
    do: request(:post, "/customers", params)
  def customer_retrieve(id),
    do: request(:get, "/customers/#{id}")
  def customer_update(id, params),
    do: request(:post, "/customers/#{id}", params)
  def customer_delete(id),
    do: request(:delete, "/customers/#{id}")
  def customer_all(params),
    do: request(:get, {"/customers", params})

  def plan_create(params),
    do: request(:post, "/plans", params)
  def plan_retrieve(id),
    do: request(:get, "/plans/#{id}")
  def plan_update(id, params),
    do: request(:post, "/plans/#{id}", params)
  def plan_delete(id),
    do: request(:delete, "/plans/#{id}")
  def plan_all(params),
    do: request(:get, {"/plans", params})

  def subscription_create(c_id, params),
    do: request(:post, "/customers/#{c_id}/subscriptions", params)
  def subscription_retrieve(c_id, id),
    do: request(:get, "/customers/#{c_id}/subscriptions/#{id}")
  def subscription_update(c_id, id, params),
    do: request(:post, "/customers/#{c_id}/subscriptions/#{id}", params)
  def subscription_delete(c_id, id),
    do: request(:delete, "/customers/#{c_id}/subscriptions/#{id}")
  def subscription_all(c_id, params),
    do: request(:get, {"/customers/#{c_id}/subscriptions", params})

  def token_create(params),
    do: request(:post, "/tokens", params)
  def token_retrieve(id),
    do: request(:get, "/tokens/#{id}")

  def account_retrieve,
    do: request(:get, "/account")

  defp request(method, uri, body \\ nil, extra_headers \\ []) do
    request_headers = headers(method) ++ extra_headers
    case HTTPoison.request(method, build_uri(uri), build_body(body), request_headers) do
      {:ok, %{status_code: 200, body: unparsed_body}} ->
        {:ok, Poison.decode!(unparsed_body) |> ResponseParser.parse_response}
      {:ok, %{status_code: code, body: unparsed_body}} ->
        handle_error(unparsed_body, code)
      {:error, reason} ->
        {:error, reason}
    end
  end

  defp handle_error(unparsed_body, code) do
    case Poison.decode(unparsed_body) do
      {:ok, body} ->
        {:error, ResponseParser.parse_response(body)}
      {:error, _json_error} ->
        {:error, {:http_error, code, unparsed_body}}
    end
  end

  defp build_uri({path, query_params}),
    do: build_uri(path) <> "?" <> URI.encode_query(query_params)
  defp build_uri(path), do: @uri_base <> path

  defp build_body(nil), do: ""
  defp build_body(body) when is_map(body),
    do: Map.to_list(body) |> build_body
  defp build_body(body) when is_list(body) do
    Enum.map(body, fn
      {key, value} ->
        key <> "=" <> (value |> to_string |> URI.encode_www_form)
      _ ->
        raise(ArgumentError, message: "all values must be binaries")
    end)
    |> Enum.join("&")
  end

  defp headers(:post) do
    headers(:get) ++ [
      {"Content-Type", "application/x-www-form-urlencoded"}
    ]
  end

  defp headers(_) do
    [
      {"Accept", "application/json"},
      {"Authorization", authorization_header_contents},
      {"User-Agent", "Elixir/StripeClient v0.0.1"},
      {"Accept-Language", "en"},
      {"Stripe-Version", @api_version}
    ]
  end

  defp authorization_header_contents do
    "Basic " <> Base.encode64(StripeClient.secret_key <> ":")
  end
end
