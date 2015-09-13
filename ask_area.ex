defmodule AskArea do
  def area do
    shape = get_shape
    [dimension_1, dimension_2] = case shape do
      :rectangle -> get_dimensions("width", "height")
      :triangle -> get_dimensions("base", "height")
      :ellipse -> get_dimensions("major axis", "minor axis")
    end
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
    [first, second] |> Enum.map &get_number/1
  end

  defp get_number prompt do
    input = input "Enter #{prompt} > "
    {number, _} = cond do
      Regex.match?(~r/\A\d+\Z/, input) -> Integer.parse(input)
      Regex.match?(~r/\A\d+.\d+(?:e-?\d+)\Z/i, input) -> Float.parse(input)
      true -> raise "'#{input}' is not a positive number"
    end
    number
  end

  defp input prompt do
    IO.write prompt
    IO.read(:line) |> String.rstrip
  end

  defp calculate_area(shape, dimension_1, dimension_2) when dimension_1 > 0 and dimension_2 > 0 do
    Geom.area shape, dimension_1, dimension_2
  end
  defp calculate_area(_, _, _), do: raise "Both dimensions must be positive"
end
