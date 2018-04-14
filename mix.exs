defmodule TravisEx.Mixfile do
  use Mix.Project

  @description """
    Travis-ci API client library for Elixir
  """

  def project do
    [app: :travis_ex,
     version: "0.0.2",
     elixir: "~> 1.0",
     description: @description,
     package: package(),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: [coveralls: :test],
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison, :poison]]
  end

  defp deps do
    [
      {:httpoison, "~> 0.8"},
      {:poison, ">= 1.5.0"},
      {:exvcr, "~> 0.6", only: :test},
      {:excoveralls, "~> 0.4", only: :test}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Hugo Duksis"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/duksis/travis_ex"}
    ]
  end
end
