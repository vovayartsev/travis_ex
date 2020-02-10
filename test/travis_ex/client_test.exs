defmodule TravisEx.ClientTest do
  use ExUnit.Case
  alias TravisEx.Client

  doctest TravisEx.Client

  @client Client.new(auth: "token")

  test "default endpoint" do
    assert @client.endpoint == "https://api.travis-ci.org/"
  end

  test "headers" do
    assert @client.headers == [
      {"User-agent", "travis_ex"},
      {"Accept", "application/json"},
      {"Content-Type", "application/json"},
      {"Travis-API-Version", "3"},
      {"Authorization", "token token"}
    ]
  end
end
