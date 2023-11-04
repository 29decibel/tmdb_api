defmodule TmdbApiTest do
  use ExUnit.Case
  doctest TmdbApi

  test "greets the world" do
    assert TmdbApi.hello() == :world
  end
end
