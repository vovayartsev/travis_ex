defmodule TravisEx.Repos do
  use HTTPoison.Base

  @doc """
  Fetch repository

  ## Examples
    TravisEx.Repos.get("duksis/travis_ex", client)

  ## More info
    https://docs.travis-ci.com/api#repositories
  """

  @spec get(binary, TravisEx.Client.t()) :: map
  def get(slug, client) do
    _get("repo/#{URI.encode_www_form(slug)}", client)
  end

  defp _get(path, client, options \\ []) do
    request!(:get, client.endpoint <> path, "", client.headers, options)
    |> process_response
  end

  defp process_response(response) do
    response.body |> Poison.decode!()
  end
end
