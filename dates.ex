defmodule Dates do
  def parts date_string do
    date_string
    |> String.split("-")
    |> Enum.map(&String.to_integer/1)
  end

  def julian date_string do
    [year, month, date] = parts date_string
    days_per_month = [31, days_in_feb(year), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    month_totals(month - 1, days_per_month) + date
  end

  defp days_in_feb(year) when rem(year, 400) == 0, do: 29
  defp days_in_feb(year) when rem(year, 100) == 0, do: 28
  defp days_in_feb(year) when rem(year, 4) == 0, do: 29
  defp days_in_feb(_year), do: 28

  defp month_totals(month, days_per_month), do: month_totals(month, days_per_month, 0)
  defp month_totals(0, _, _), do: 0
  defp month_totals(1, [head|_], total), do: total + head
  defp month_totals(month, [head|days_per_remaining_month], total), do: month_totals(month - 1, days_per_remaining_month, total + head)
end
