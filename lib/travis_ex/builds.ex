defmodule TravisEx.Builds do
  use HTTPoison.Base

  @doc """
  Fetch repository

  ## Examples
    TravisEx.Builds.get("1234567", client)

  ## More info
    https://developer.travis-ci.com/resource/build#Build
  """

  @spec get(binary, TravisEx.Client.t()) :: map
  def get(build_id, client) do
    _get("build/#{build_id}", client)
  end

  defp _get(path, client, options \\ []) do
    request!(:get, client.endpoint <> path, "", client.headers, options)
    |> process_response
  end

  defp process_response(response) do
    response.body |> Poison.decode!()
  end
end
