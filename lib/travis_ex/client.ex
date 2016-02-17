defmodule TravisEx.Client do
  defstruct headers: nil, endpoint: "https://api.travis-ci.org/"

  @user_agent [{"User-agent", "travis_ex"}]
  @accept [{"Accept", "application/vnd.travis-ci.2+json"}]

  @type t :: %__MODULE__{headers: list, endpoint: binary}

  @spec new(map) :: t
  def new(auth: auth) do
    %__MODULE__{ headers: @user_agent ++ @accept ++ [{"Authorization", "token #{auth}"}] }
  end
end
