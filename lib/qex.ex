defmodule Qex do
  @moduledoc ~S"""

  A `:queue` wrapper with improvements in API and addition of Protocol implementations

  ## Protocols

  `Inspect` and `Enumerable` are implemented
  """

  @opaque t :: %__MODULE__{}

  defstruct data: :queue.new

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

  @spec push_front(t, term) :: t
  def push_front(%__MODULE__{data: q}, item) do
    %__MODULE__{data: :queue.in_r(item, q)}
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

  @spec pop_back(t) :: {{:value, term}, t} | {:empty, t}
  def pop_back(%__MODULE__{data: q}) do
    case :queue.out_r(q) do
      {{:value, v}, q} -> {{:value, v}, %__MODULE__{data: q}}
      {:empty, q} -> {:empty, %__MODULE__{data: q}}
    end
  end

  @spec pop_back!(t) :: {term, t} | no_return
  def pop_back!(%__MODULE__{data: q}) do
    case :queue.out_r(q) do
      {{:value, v}, q} -> {v, %__MODULE__{data: q}}
      {:empty, _q} -> raise "Queue is empty"
    end
  end

  @spec reverse(t) :: t
  def reverse(%__MODULE__{data: q}) do
    %__MODULE__{data: :queue.reverse(q)}
  end

  @spec split(t, pos_integer) :: {t, t}
  def split(%__MODULE__{data: q}, n) do
    with {q1, q2} <- :queue.split(n, q) do
      {%__MODULE__{data: q1}, %__MODULE__{data: q2}}
    end
  end
end
