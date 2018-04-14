# TravisEx

[![Build Status](https://travis-ci.org/duksis/travis_ex.svg?branch=master)](https://travis-ci.org/duksis/travis_ex)

[Travis-ci API](https://docs.travis-ci.com/api) client library for Elixir

## API coverage

[Entities:](https://docs.travis-ci.com/api?http#entities)
  * [ ] Accounts
  * [ ] Annotations
  * [ ] Branches
  * [ ] Broadcasts
  * [ ] Builds
  * [ ] Caches
  * [ ] Commits
  * [ ] Hooks
  * [ ] Jobs
  * [ ] Logs
  * [ ] Permissions
  * [ ] Repository Keys
  * [x] Repositories
  * [ ] Requests
  * [ ] Settings: General
  * [ ] Settings: Environment Variables
  * [ ] Settings: SSH Key
  * [ ] Users

  as you can see still a far way to go!

## Installation

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

NOTE: provide `:endpoint` option explicitely when using with Travis CI PRO

```iex
iex> client = TravisEx.Client.new(auth: "bb1568179c33308f4da7dceab", endpoint: :pro)
```

## License

Released under the [MIT license](LICENSE).


## Contributing

Start by forking this repo

Then run this command to fetch dependencies and run tests:

```console
MIX_ENV=test mix do deps.get, test
```

Pull requests are greatly appreciated
