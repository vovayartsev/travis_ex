# TravisEx

Travis-ci API client library for Elixir

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add travis_ex to your list of dependencies in `mix.exs`:

        def deps do
          [{:travis_ex, "~> 0.0.1"}]
        end

  2. Ensure travis_ex is started before your application:

        def application do
          [applications: [:travis_ex]]
        end
