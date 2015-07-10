defmodule Powers do
  def raise(x, n) when is_integer(n) and n >= 0, do: _raise(x, n)
  def raise(x, n) when is_integer(n), do: 1.0 / _raise(x, -n)
  defp _raise(_x, 0), do: 1
  defp _raise(x, 1), do: x
  defp _raise(x, n), do: x * _raise(x, n - 1)
end
