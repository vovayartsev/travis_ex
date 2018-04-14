defmodule TravisEx.Builds do
  use HTTPoison.Base

  @doc """
  Trigger a build

  ## Examples
    request = %{branch: "master"}
    TravisEx.Builds.trigger("duksis/travis_ex", request, client)

  ## More info
    https://docs.travis-ci.com/user/triggering-builds/
  """

  @spec get(binary, TravisEx.Client.t) :: map
  def trigger(slug, request, client) do
    payload = %{request: request}
    _post("repos/#{URI.encode(slug)}", payload, client)
  end

  defp _post(path, payload, client, options \\ []) do
    request!(:get, client.endpoint <> path, "", client.headers, options)
    |> process_response
  end

  defp process_response(response) do
    response.body |> Poison.decode!
  end
end
