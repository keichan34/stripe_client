defmodule StripeClient.Mixfile do
  use Mix.Project

  def project do
    [
      app: :stripe_client,
      version: "0.0.2",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      source_url: "https://github.com/keichan34/stripe_client",
      docs: [
        extras: ["README.md"]
      ],
      package: package,
      description: description,
      preferred_cli_env: [
        vcr: :test,
        "vcr.delete": :test,
        "vcr.check": :test,
        "vcr.show": :test
      ],
      aliases: [
        "publish": [&git_tag/1, "hex.publish", "hex.docs"]
      ]
    ]
  end

  def application do
    [
      applications: [
        :logger,
        :httpoison,
        :poison,
        :crypto
      ],
      mod: {StripeClient, []}
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 0.8.1"},
      {:poison, "~> 2.1 or ~> 1.5"},
      {:exvcr, "~> 0.7", only: :test},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev},
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Keitaroh Kobayashi"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/keichan34/stripe_client",
        "Docs" => "http://hexdocs.pm/stripe_client/readme.html"
      }
    ]
  end

  defp description do
    """
    Yet another Stripe client for Elixir.
    """
  end

  defp git_tag(_args) do
    version_tag = case Version.parse(project[:version]) do
      {:ok, %Version{pre: []}} ->
        "v" <> project[:version]
      _ ->
        raise "Version should be a release version."
    end
    System.cmd "git", ["tag", "-s", version_tag, "-m", "Release #{version_tag}"]
    System.cmd "git", ["push", "--tags"]
  end
end
