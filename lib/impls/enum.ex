defimpl Enumerable, for: Queue do
  def count(%Queue{in_list: in_list, out_list: out_list}) do
    {:ok, Enum.count(in_list) + Enum.count(out_list)}
  end

  def member?(%Queue{in_list: in_list, out_list: out_list}, item) do
    {:ok, Enum.member?(in_list, item) or Enum.member?(out_list, item)}
  end

  def reduce(%Queue{in_list: in_list, out_list: out_list}, acc, fun) do
    Enumerable.reduce(out_list ++ Enum.reverse(in_list), acc, fun)
  end
end
