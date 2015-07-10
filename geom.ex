defmodule Geom do
  @moduledoc """
  Geometry stuff
  """
  @doc """
  Calculate the area of a rectangle with the given length and width. If
  arguments are omitted, they default to 1.
  """
  def area(length \\ 1, width \\ 1), do: length * width
end
