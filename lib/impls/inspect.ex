defimpl Inspect, for: Queue do
  import Inspect.Algebra

  def inspect(%Queue{in_list: in_list, out_list: out_list}, opts) do
    concat ["<#Queue", to_doc(out_list ++ Enum.reverse(in_list), opts), ">"]
  end
end
