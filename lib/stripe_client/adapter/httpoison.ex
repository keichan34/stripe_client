defmodule StripeClient.Adapter.HTTPoison do
  @moduledoc """
  The HTTPoison adapter for StripeClient.
  """

  @behaviour StripeClient.Adapter

  alias StripeClient.Adapter.HTTPoison.ResponseParser

  @uri_base "https://api.stripe.com/v1"
  @api_version "2016-03-07"

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

  defp headers(:post) do
    headers(:get) ++ [
      {"Content-Type", "application/json"}
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
    "Basic " <> Base.encode64(Webpay.secret_key <> ":")
  end
end
