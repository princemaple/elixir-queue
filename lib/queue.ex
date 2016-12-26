defmodule Qex do
  @moduledoc ~S"""

  A minimal FIFO queue implementation for Elixir

  A primitive queue data structure that doesn't spawn a separate process

  ## Protocols

  Inspect and Enumerable are implemented

  ## Examples

      iex> q = Qex.new([1, 2, 3])
      iex> Enum.count(q)
      3
      iex> Enum.sum(q)
      6
      iex> inspect(q)
      "<#Qex[1, 2, 3]>"
      iex> {_item, q} = Qex.pop(q)
      {1, %Qex{in_list: [], out_list: [2, 3]}}
      iex> Enum.count(q)
      2
      iex> q = Qex.push(q, 4)
      %Qex{in_list: [4], out_list: [2, 3]}
      iex> Enum.count(q)
      3
      iex> {_item, q} = Qex.pop(q)
      {2, %Qex{in_list: [4], out_list: [3]}}
      iex> {_item, q} = Qex.pop(q)
      {3, %Qex{in_list: [4], out_list: []}}
      iex> {_item, q} = Qex.pop(q)
      {4, %Qex{in_list: [], out_list: []}}
      iex> Enum.count(q)
      0
      iex> Enum.sum(q)
      0
      iex> inspect(q)
      "<#Qex[]>"
  """

  @opaque t :: %__MODULE__{}

  defstruct [in_list: [], out_list: []]

  @doc """
  ## Examples

      iex> Qex.new
      %Qex{in_list: [], out_list: []}

      iex> Qex.new([1,2,3])
      %Qex{in_list: [], out_list: [1, 2, 3]}
  """
  @spec new([term]) :: t
  def new(list \\ []) do
    %__MODULE__{out_list: list}
  end

  @doc """
  ## Examples

      iex> Qex.new |> Qex.push(1)
      %Qex{in_list: [1], out_list: []}

      iex> Qex.new([1, 2, 3]) |> Qex.push(4)
      %Qex{in_list: [4], out_list: [1, 2, 3]}

      iex> Qex.new |> Qex.push(1) |> Enum.count
      1

      iex> Qex.new([1,2,3]) |> Qex.push(4) |> Enum.count
      4
  """
  @spec push(t, term) :: t
  def push(%Qex{in_list: in_list} = q, item) do
    %{q | in_list: [item | in_list]}
  end

  @doc """
  ## Examples

      iex> Qex.new |> Qex.pop
      {nil, %Qex{in_list: [], out_list: []}}

      iex> Qex.new([1,2,3]) |> Qex.pop
      {1, %Qex{in_list: [], out_list: [2, 3]}}

      iex> q = Qex.new([2,3])
      iex> {_item, q} = Qex.pop(q)
      {2, %Qex{in_list: [], out_list: [3]}}
      iex> {_item, q} = Qex.pop(q)
      {3, %Qex{in_list: [], out_list: []}}
      iex> {_item, _q} = Qex.pop(q)
      {nil, %Qex{in_list: [], out_list: []}}

      iex> %Qex{in_list: [1, 2], out_list: []} |> Qex.pop
      {2, %Qex{in_list: [], out_list: [1]}}
  """
  @spec pop(t, term) :: {term, t}
  def pop(q, default \\ nil)

  def pop(%Qex{in_list: [], out_list: []} = q, default), do: {default, q}

  def pop(%Qex{in_list: in_list, out_list: []} = q, default) do
    pop(%{q | out_list: Enum.reverse(in_list), in_list: []}, default)
  end

  def pop(%Qex{out_list: [item | out_list]} = q, _default) do
    {item, %{q | out_list: out_list}}
  end
end
