defmodule TravisEx.Client do
  defstruct headers: nil, endpoint: nil

  @user_agent [{"User-agent", "travis_ex"}]
  @accept [{"Accept", "application/vnd.travis-ci.2+json"}]

  @type t :: %__MODULE__{headers: list, endpoint: binary}

  @spec new(map) :: t
  def new(options) do
    auth = Keyword.get(options, :auth) || raise "TravisEx.Client.new is missing a required option :auth"
    endpoint = Keyword.get(options, :endpoint, :org)

    %__MODULE__{
      headers: @user_agent ++ @accept ++ [{"Authorization", "token #{auth}"}],
      endpoint: choose_endpoint(endpoint)
    }
  end

  # paid (PRO) and free (ORG) versions of TravisCI have different API endpoints
  defp choose_endpoint(endpoint) do
    case endpoint do
      :pro -> "https://api.travis-ci.com/"
      :org -> "https://api.travis-ci.org/"
      other -> other
    end
  end
end
