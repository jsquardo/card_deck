defmodule CardDeckTest do
  use ExUnit.Case
  doctest CardDeck

  test "greets the world" do
    assert CardDeck.hello() == :world
  end
end
