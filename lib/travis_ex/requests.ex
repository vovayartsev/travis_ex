defmodule TravisEx.Requests do
  use HTTPoison.Base

  @doc """
  Trigger a build request

  ## Examples
    request = %{branch: "master"}
    TravisEx.Requests.create(request, "duksis/travis_ex", client)

  ## More info
    https://docs.travis-ci.com/user/triggering-builds/
  """

  @spec create(map, binary, TravisEx.Client.t()) :: map
  def create(request, slug, client) do
    payload = %{request: request}
    _post("repo/#{URI.encode_www_form(slug)}/requests", payload, client)
  end

  defp _post(path, payload, client, options \\ []) do
    post!(client.endpoint <> path, Poison.encode!(payload), client.headers, options)
    |> process_response
  end

  defp process_response(response) do
    response.body |> Poison.decode!()
  end
end
