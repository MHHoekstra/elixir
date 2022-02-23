defmodule CruzandoLagos do
  def main do
    IO.gets("")
    |> String.trim()
    |> String.to_integer()
    |> can_cross()
  end

  defp can_cross(number_of_lines) do
    can_cross(number_of_lines, 0)
  end

  defp can_cross(number_of_lines, current_line) do
    line = IO.gets("")

    if String.contains?(line, "-") do
      can_cross(line, false, 0, 0, number_of_lines, current_line + 1)
    else
      can_cross(line, true, 1, 1, number_of_lines, current_line + 1)
    end
  end

  defp can_cross(_line, _jumping, jump_size, number_of_jumps, number_of_lines, current_line)
       when number_of_lines == current_line do
    if jump_size >= 3 do
      IO.puts("N")
    else
      IO.puts(number_of_jumps)
    end
  end

  defp can_cross(_line, _jumping, jump_size, _number_of_jumps, _number_of_lines, _current_line)
       when jump_size >= 3 do
    IO.puts("N")
  end

  defp can_cross(line, jumping, jump_size, number_of_jumps, number_of_lines, current_line) do
    if String.contains?(line, "-") do
      IO.gets("") |> can_cross(false, 0, number_of_jumps, number_of_lines, current_line + 1)
    else
      if jumping do
        IO.gets("")
        |> can_cross(jumping, jump_size + 1, number_of_jumps, number_of_lines, current_line + 1)
      else
        IO.gets("") |> can_cross(true, 1, number_of_jumps + 1, number_of_lines, current_line + 1)
      end
    end
  end
end

CruzandoLagos.main()
