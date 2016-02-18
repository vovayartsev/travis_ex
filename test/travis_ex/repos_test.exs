defmodule TravisEx.ReposTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import TravisEx.Repos

  doctest TravisEx.Repos

  @client TravisEx.Client.new(auth: "9f9V13ovJOLYPqvW-A")

  setup_all do
    HTTPoison.start
  end

  test "get/2" do
    use_cassette "repos#get" do
      %{"repo" => %{"description" => description}} = get("duksis/travis_ex", @client)
      assert description == "Travis-ci API client library for Elixir"
    end
  end
end
