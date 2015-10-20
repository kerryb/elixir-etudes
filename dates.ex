defmodule Dates do
  def parts date_string do
    date_string
    |> String.split("-")
    |> Enum.map(&String.to_integer/1)
  end
end
