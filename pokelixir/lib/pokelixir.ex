defmodule Pokelixir do
  import Finch


  @moduledoc """
  Documentation for `Pokelixir`.
  """


def get_pokemon_info(name) do

  url = "https://pokeapi.co/api/v2/pokemon/#{name}"

  case Finch.get(url) do
    {:ok, %{status_code: 200, body: body}} ->
      decoded_body = Jason.decode!(body)
      IO.puts(decoded_body)
      {:ok, decoded_body}

    {:ok, %{status_code: status_code}} ->
      IO.puts("Request failed with status code #{status_code}")
      {:error, "Request failed with status code #{status_code}"}

    {:error, reason} ->
      IO.puts("Error: #{reason}")
      {:error, reason}
  end
end
end
