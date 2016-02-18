# TravisEx

[Travis-ci API](https://docs.travis-ci.com/api) client library for Elixir

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

## Usage

```iex
iex> client = TravisEx.Client.new(auth: "bb1568179c33308f4da7dceab")
iex> %{"repo" => %{"last_build_state" => build_state}} = TravisEx.Repos.get "duksis/travis_ex", client
iex> build_state #=> "passed"
```
