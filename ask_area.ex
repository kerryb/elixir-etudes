defmodule AskArea do
  def area do
    shape = get_shape
    [dimension_1, dimension_2] = case shape do
      :rectangle -> get_dimensions("width", "height")
      :triangle -> get_dimensions("base", "height")
      :ellipse -> get_dimensions("major axis", "minor axis")
    end |> numericalise_inputs
    calculate_area shape, dimension_1, dimension_2
  rescue
    e -> IO.puts e.message
  end

  defp get_shape do
    case input("R)ectangle, T)riangle, or E)llipse: ") |> String.first |> String.downcase do
      "r" -> :rectangle
      "t" -> :triangle
      "e" -> :ellipse
      shape -> raise "Unrecognised shape: #{shape}"
    end
  end

  defp get_dimensions first, second do
    [first, second] |> Enum.map fn(d) -> input("Enter #{d} > ") end
  end

  defp input prompt do
    IO.write prompt
    IO.read(:line) |> String.rstrip
  end

  defp numericalise_inputs inputs do
    inputs |> Enum.map(&Float.parse/1) |> Enum.map(fn({n, _}) -> n end)
  rescue
    _ -> raise "Both dimensions must be numeric"
  end

  defp calculate_area(shape, dimension_1, dimension_2) when dimension_1 > 0 and dimension_2 > 0 do
    Geom.area shape, dimension_1, dimension_2
  end
  defp calculate_area(_, _, _), do: raise "Both dimensions must be positive"
end
