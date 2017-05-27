# user_rates = Neko.Shikimori.UserRateClient.get!
#   ("user_rates", [], params: %{user_id: 1}).body
defmodule Neko.Shikimori.UserRateClient do
  use HTTPoison.Base
  alias Shikimori.UserRate

  @base_url "https://shikimori.org/api/v2/"

  defp process_url(url), do: @base_url <> url

  defp process_response_body(body) do
    body
    |> Poison.Parser.parse!(keys: :atoms)
    |> Enum.map(&(struct(UserRate, &1)))
  end
end
