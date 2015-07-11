defmodule Powers do
  import Kernel, except: [raise: 2]

  def raise(_x, 0), do: 1
  def raise(x, n) when is_integer(n) and n < 0, do: 1.0 / raise(x, -n)
  def raise(x, n) when is_integer(n), do: _raise(x, n, 1)
  defp _raise(_x, 0, acc), do: acc
  defp _raise(x, n, acc), do: _raise(x, n - 1, acc * x)

  def nth_root(x, n) when is_integer(n), do: _nth_root(x, n, x / 2.0)
  defp _nth_root(x, n, a) do
    f = raise(a, n) - x
    f_prime = n * raise(a, n - 1)
    next = a - f / f_prime
    IO.puts "Current approximation: #{next}"
    if abs(next - a) < raise(10, -8) do
      next
    else
      _nth_root x, n, next
    end
  end
end
