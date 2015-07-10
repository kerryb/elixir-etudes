defmodule Geom do
  @moduledoc """
  Geometry stuff
  """

  @doc """
  Calculate the area of a shape with the given dimensions. Supported shapes are
  :rectangle, :triangle and :ellipse.

  ## Examples:

      iex> Geom.area :rectangle, 2, 4
      8

      iex> Geom.area :triangle, 2, 4
      4.0

      iex> Geom.area :ellipse, 2, 4
      25.132741228718345
  """
  def area(:rectangle, length, width), do: length * width
  def area(:triangle, base, height), do: 0.5 * base * height
  def area(:ellipse, length, width), do: :math.pi * length * width
end
