defmodule StripeClient.Adapter.HTTPoison.ResponseParserGenerator do
  @moduledoc false

  defmacro object_parser(object_name, tmpl) do
    quote do
      def parse_response(%{"object" => unquote(object_name)} = response) do
        Enum.reduce response, unquote(tmpl), fn({key, value}, acc) ->
          Map.put acc, String.to_existing_atom(key), parse_response(value)
        end
      end
    end
  end
end

defmodule StripeClient.Adapter.HTTPoison.ResponseParser do
  @moduledoc false

  alias StripeClient.{Error, DeleteResponse}

  import StripeClient.Adapter.HTTPoison.ResponseParserGenerator

  def parse_response(%{"error" => error_params}) do
    Enum.reduce error_params, %Error{}, fn({key, value}, acc) ->
      Map.put acc, String.to_existing_atom(key), value
    end
  end

  def parse_response(%{"deleted" => true} = params) do
    Enum.reduce params, %DeleteResponse{}, fn({key, value}, acc) ->
      Map.put acc, String.to_existing_atom(key), value
    end
  end

  object_parser "account",      %StripeClient.Account{}
  object_parser "card",         %StripeClient.Card{}
  object_parser "customer",     %StripeClient.Customer{}
  object_parser "list",         %StripeClient.List{}
  object_parser "plan",         %StripeClient.Plan{}
  object_parser "subscription", %StripeClient.Subscription{}
  object_parser "token",        %StripeClient.Token{}

  def parse_response(list) when is_list(list),
    do: Enum.map(list, &parse_response/1)
  def parse_response(other),
    do: other
end
