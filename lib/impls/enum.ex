defimpl Enumerable, for: Qex do
  def count(%Qex{in_list: in_list, out_list: out_list}) do
    {:ok, Enum.count(in_list) + Enum.count(out_list)}
  end

  def member?(%Qex{in_list: in_list, out_list: out_list}, item) do
    {:ok, Enum.member?(in_list, item) or Enum.member?(out_list, item)}
  end

  def reduce(%Qex{in_list: in_list, out_list: out_list}, acc, fun) do
    Enumerable.reduce(out_list ++ Enum.reverse(in_list), acc, fun)
  end
end
