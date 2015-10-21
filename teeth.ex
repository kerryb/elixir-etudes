defmodule Teeth do
  def alert(depths), do: alert(1, [], depths)
  defp alert(_, alerts, []), do: Enum.reverse(alerts)
  defp alert(index, alerts, [head|tail]), do: alert(index + 1, check(index, alerts, head), tail)
  defp check(_, alerts, []), do: alerts
  defp check(index, alerts, [head|_]) when head >= 4, do: [index|alerts]
  defp check(index, alerts, [_|tail]), do: check(index, alerts, tail)

  def pocket_depths do
    [[0], [2,2,1,2,2,1], [3,1,2,3,2,3],
      [3,1,3,2,1,2], [3,2,3,2,2,1], [2,3,1,2,1,1],
      [3,1,3,2,3,2], [3,3,2,1,3,1], [4,3,3,2,3,3],
      [3,1,1,3,2,2], [4,3,4,3,2,3], [2,3,1,3,2,2],
      [1,2,1,1,3,2], [1,2,2,3,2,3], [1,3,2,1,3,3], [0],
      [3,2,3,1,1,2], [2,2,1,1,3,2], [2,1,1,1,1,2],
      [3,3,2,1,1,3], [3,1,3,2,3,2], [3,3,1,2,3,3],
      [1,2,2,3,3,3], [2,2,3,2,3,3], [2,2,2,4,3,4],
      [3,4,3,3,3,4], [1,1,2,3,1,2], [2,2,3,2,1,3],
      [3,4,2,4,4,3], [3,3,2,1,2,3], [2,2,2,2,3,3],
      [3,2,3,2,3,2]]
  end
end
