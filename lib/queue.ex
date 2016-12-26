defmodule Queue do
  @moduledoc ~S"""
  iex> q = Queue.new([1, 2, 3])
  iex> Enum.count(q)
  3
  iex> Enum.sum(q)
  6
  iex> inspect(q)
  "<#Queue[1, 2, 3]>"
  iex> {_item, q} = Queue.pop(q)
  {1, %Queue{in_list: [], out_list: [2, 3]}}
  iex> Enum.count(q)
  2
  iex> q = Queue.push(q, 4)
  %Queue{in_list: [4], out_list: [2, 3]}
  iex> Enum.count(q)
  3
  iex> {_item, q} = Queue.pop(q)
  {2, %Queue{in_list: [4], out_list: [3]}}
  iex> {_item, q} = Queue.pop(q)
  {3, %Queue{in_list: [4], out_list: []}}
  iex> {_item, q} = Queue.pop(q)
  {4, %Queue{in_list: [], out_list: []}}
  iex> Enum.count(q)
  0
  iex> Enum.sum(q)
  0
  iex> inspect(q)
  "<#Queue[]>"
  """

  defstruct [in_list: [], out_list: []]

  @doc """
  iex> Queue.new
  %Queue{in_list: [], out_list: []}

  iex> Queue.new([1,2,3])
  %Queue{in_list: [], out_list: [1, 2, 3]}
  """
  def new(list \\ []) do
    %__MODULE__{out_list: list}
  end

  @doc """
  iex> Queue.new |> Queue.push(1)
  %Queue{in_list: [1], out_list: []}

  iex> Queue.new([1, 2, 3]) |> Queue.push(4)
  %Queue{in_list: [4], out_list: [1, 2, 3]}

  iex> Queue.new |> Queue.push(1) |> Enum.count
  1

  iex> Queue.new([1,2,3]) |> Queue.push(4) |> Enum.count
  4
  """
  def push(%Queue{in_list: in_list} = q, item) do
    %{q | in_list: [item | in_list]}
  end

  @doc """
  iex> Queue.new |> Queue.pop
  {nil, %Queue{in_list: [], out_list: []}}

  iex> Queue.new([1,2,3]) |> Queue.pop
  {1, %Queue{in_list: [], out_list: [2, 3]}}

  iex> q = Queue.new([2,3])
  iex> {_item, q} = Queue.pop(q)
  {2, %Queue{in_list: [], out_list: [3]}}
  iex> {_item, q} = Queue.pop(q)
  {3, %Queue{in_list: [], out_list: []}}
  iex> {_item, _q} = Queue.pop(q)
  {nil, %Queue{in_list: [], out_list: []}}

  iex> %Queue{in_list: [1, 2], out_list: []} |> Queue.pop
  {2, %Queue{in_list: [], out_list: [1]}}
  """
  def pop(q, default \\ nil)

  def pop(%Queue{in_list: [], out_list: []} = q, default), do: {default, q}

  def pop(%Queue{in_list: in_list, out_list: []} = q, default) do
    pop(%{q | out_list: Enum.reverse(in_list), in_list: []}, default)
  end

  def pop(%Queue{out_list: [item | out_list]} = q, _default) do
    {item, %{q | out_list: out_list}}
  end
end
