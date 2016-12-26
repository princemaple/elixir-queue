defmodule Qex do
  @moduledoc ~S"""

  A minimal FIFO queue implementation for Elixir

  A primitive queue data structure that doesn't spawn a separate process

  ## Protocols

  Inspect and Enumerable are implemented
  """

  @opaque t :: %__MODULE__{}

  defstruct data: nil

  @spec new([term] | Range.t) :: t
  def new(init_data \\ [])

  def new(x..y) do
    %__MODULE__{data: :queue.from_list(Enum.to_list(x..y))}
  end

  def new(list) do
    %__MODULE__{data: :queue.from_list(list)}
  end

  @spec push(t, term) :: t
  def push(%__MODULE__{data: q}, item) do
    %__MODULE__{data: :queue.in(item, q)}
  end

  @spec pop(t) :: {{:value, term}, t} | {:empty, t}
  def pop(%__MODULE__{data: q}) do
    case :queue.out(q) do
      {{:value, v}, q} -> {{:value, v}, %__MODULE__{data: q}}
      {:empty, q} -> {:empty, %__MODULE__{data: q}}
    end
  end

  @spec pop!(t) :: {term, t} | no_return
  def pop!(%__MODULE__{data: q}) do
    case :queue.out(q) do
      {{:value, v}, q} -> {v, %__MODULE__{data: q}}
      {:empty, _q} -> raise "Queue is empty"
    end
  end
end
