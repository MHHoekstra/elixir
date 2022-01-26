defmodule Leaf do
  defstruct value: nil, left: nil, right: nil
end

defmodule BinaryTree do
  @moduledoc """
  A simple Binary Tree for numbers implemented in Elixir.
  For the Leafs, this Binary Tree uses a Struct of %Leaf{value: Number, left: %Leaf, right: %Leaf}
  """

  @doc """
  Creates a new BinaryTree from a list of numbers.
  ## Examples

      iex> BinaryTree.add([1,2])
      %Leaf{value: 1, left: nil, right: %Leaf{value: 2, nil, nil}}

  """
  def new([head | tail]) when is_number(head) do
    new(head) |> add(tail)
  end

  @doc """
  Creates a new BinaryTree from a value, left leaf and right leaf;

  ## Examples
      iex> BinaryTree.new(1)
      %Leaf{value: 1, left: nil, right: nil}
      iex> left_leaf = BinaryTree.new(1)
      iex> right_leaf = BinaryTree.new(3)
      iex> tree = BinaryTree.new(2, left: left_leaf, right: right_leaf)
      %Leaf{value: 2, left: %Leaf{...}, right: %Leaf{...}}
  """
  def new(value, left \\ nil, right \\ nil) when is_number(value) do
    %Leaf{value: value, left: left, right: right}
  end

  @doc """
  Checks if a value exists in a given tree

  ## Examples
      iex> tree = BinaryTree.new(1)
      iex> BinaryTree.contains?(tree, 1)
      true
  """
  def contains?(tree, value) do
    cond do
      is_nil(tree) -> false
      tree.value == value -> true
      tree.value > value -> contains?(tree.left, value)
      tree.value < value -> contains?(tree.right, value)
    end
  end

  @doc """
  Adds a new Leaf to an existing BinaryTree.
  The value can either be a number or a list of numbers to be added sequentially

  ## Examples
      iex> tree = BinaryTree.new(2)
      iex> BinaryTree.add(tree, 3)
      %Leaf{value: 2, left: nil, right: %Leaf{value: 3, left: nil, right: nil}}
      iex> BinaryTree.add(tree, [1,3])
      %Leaf{value: 2, left:  %Leaf{value: 1, left: nil, right: nil}, right: %Leaf{value: 3, left: nil, right: nil}}

  """
  def add(tree, [head | tail]) do
    add(tree, head) |> add(tail)
  end

  def add(tree, []) do
    tree
  end

  def add(nil, value) do
    new(value)
  end

  def add(tree, value) when tree.value < value do
    new(tree.value, tree.left, add(tree.right, value))
  end

  def add(tree, value) when tree.value > value do
    new(tree.value, add(tree.left, value), tree.right)
  end

  def add(tree, value) when tree.value == value do
    tree
  end
end
