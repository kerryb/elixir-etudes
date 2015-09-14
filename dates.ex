defmodule Dates do
  def parts(date_string), do: String.split(date_string, "-") |> Enum.map(&Integer.parse/1) |> Enum.map(fn({x, _}) -> x end)
end
