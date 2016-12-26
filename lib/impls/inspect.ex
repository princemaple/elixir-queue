defimpl Inspect, for: Queue do
  import Inspect.Algebra

  def inspect(%Queue{} = q, opts) do
    concat ["<#Queue", to_doc(Enum.to_list(q), opts), ">"]
  end
end
