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
  def area({shape, dimension_1, dimension_2}) when dimension_1 > 0 and dimension_2 > 0 do
    case shape do
      :rectangle -> dimension_1 * dimension_2
      :triangle -> 0.5 * dimension_1 * dimension_2
      :ellipse -> :math.pi * dimension_1 * dimension_2
      true -> 0
    end
  end
end
