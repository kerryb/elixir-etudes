defmodule Powers do
  def raise(_x, 0), do: 1
  def raise(x, n) when is_integer(n) and n < 0, do: 1.0 / Powers.raise(x, -n)
  def raise(x, n) when is_integer(n), do: _raise(x, n, 1)
  defp _raise(_x, 0, acc), do: acc
  defp _raise(x, n, acc), do: _raise(x, n - 1, acc * x)
end
