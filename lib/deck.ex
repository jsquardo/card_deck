defmodule CardDeck.Deck do
  @moduledoc "Represents a deck of cards"

  defstruct cards: []

  @type t :: %__MODULE__{cards: list()}
end
