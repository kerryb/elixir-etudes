defmodule Geom do
  @moduledoc """
  Geometry stuff
  """

  @doc """
  Calculate the area of a shape with the given dimensions. Supported shapes are
  :rectangle, :triangle and :ellipse.

  ## Examples:

      iex> Geom.area {:rectangle, 2, 4}
      8

      iex> Geom.area {:triangle, 2, 4}
      4.0

      iex> Geom.area {:ellipse, 2, 4}
      25.132741228718345
  """
  def area({shape, dimension_1, dimension_2}), do: area(shape, dimension_1, dimension_2)
  defp area(:rectangle, length, width) when length > 0 and width > 0, do: length * width
  defp area(:triangle, base, height) when base > 0 and height > 0, do: 0.5 * base * height
  defp area(:ellipse, length, width) when length > 0 and width > 0, do: :math.pi * length * width
  defp area(_, _, _), do: 0
end
