defmodule ProtocolPlayground do
  alias ProtocolPlayground.MyCollectable

  def apply_into(collection) do
    Enum.into(collection, %MyCollectable{})
  end

  def apply_into(collection, fun) do
    Enum.into(collection, %MyCollectable{}, fun)
  end
end
