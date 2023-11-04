defmodule TMDB.Search do
  use Tesla

  plug(Tesla.Middleware.BaseUrl, "https://api.themoviedb.org")

  plug(Tesla.Middleware.Headers, [
    {"authorization", "Bearer #{System.get_env("TMDB_ACCESS_TOKEN")}"}
  ])

  plug(Tesla.Middleware.JSON)

  def all(query, page \\ 1) do
    case get("/3/search/multi",
           query: [query: query, include_adult: false, language: "en-US", page: page]
         ) do
      {:ok, response} -> results(response)
      {:error, error} -> error
    end
  end

  def movie(query, page \\ 1) do
    case get("/3/search/movie",
           query: [query: query, include_adult: false, language: "en-US", page: page]
         ) do
      {:ok, response} -> results(response)
      {:error, error} -> error
    end
  end

  defp results(%Tesla.Env{body: body}) do
    body
  end
end
