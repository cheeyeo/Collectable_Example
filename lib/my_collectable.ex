defmodule ProtocolPlayground.MyCollectable do
  defstruct results: []
end

defimpl Collectable, for: ProtocolPlayground.MyCollectable do
  def into(original) do
    {original, fn
      source, {:cont, nil} -> source
      source, {:cont, value} ->
        %ProtocolPlayground.MyCollectable{source | results: [value|source.results]}
      source, :done ->
        %ProtocolPlayground.MyCollectable{source | results: :lists.reverse(source.results)}
      _, :halt -> :ok
    end}
  end
end
