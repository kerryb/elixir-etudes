defmodule Stats do
  def minimum([head|tail]), do: minimum head, tail
  defp minimum(min, []), do: min
  defp minimum(min, [head|tail]) when head < min, do: minimum(head, tail)
  defp minimum(min, [_|tail]), do: minimum(min, tail)

  def maximum([head|tail]), do: maximum head, tail
  defp maximum(max, []), do: max
  defp maximum(max, [head|tail]) when head > max, do: maximum(head, tail)
  defp maximum(max, [_|tail]), do: maximum(max, tail)

  def range(list), do: [minimum(list), maximum(list)]
end
