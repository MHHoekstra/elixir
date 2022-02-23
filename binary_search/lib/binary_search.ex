defmodule BinarySearch do
  @moduledoc """
  A simple Binary Search algorithm made in Elixir.
  """

  @doc """
  Searches for the index of a key in a collection, out of the box it works with numbers but it accepts a comparator function for other types.
  ## Examples

      iex> BinarySearch.search([1,3,5,7,9],3)
      2
      iex> BinarySearch.search([1,3,5,7,9],10)
      -1
  """
  def search(collection, key, comparator \\ fn a, b -> a - b end) do
    search(collection, key, 0, tuple_size(collection) - 1, comparator)
  end

  defp search(_, _, low, high, _) when low > high do
    -1
  end

  defp search(collection, key, low, high, comparator) do
    mid = trunc((low + high) / 2)
    midValue = elem(collection, mid)
    comp = comparator.(key, midValue)

    cond do
      comp == 0 -> mid
      comp > 0 -> search(collection, key, mid + 1, high, comparator)
      comp < 0 -> search(collection, key, low, mid - 1, comparator)
    end
  end
end
