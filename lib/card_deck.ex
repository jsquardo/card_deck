defmodule CardDeck do
  @moduledoc """
  A simple library for creating and manipulating a standard 52-card deck.
  """

  @suits [:hearts, :diamonds, :clubs, :spades]
  @ranks ~w(2 3 4 5 6 7 8 9 10 J Q K A)a

  @doc """
  Returns a new, ordered deck of 52 cards
  """
  def new_deck do
    for suit <- @suits, rank <- @ranks do
      {rank, suit}
    end
  end

  @doc """
  Shuffles the given deck of cards.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Deals `count` cards from the top of the deck.

  Returns a tuple: `{hand, remaining_deck}
  """
  def deal(deck, count) do
    Enum.split(deck,count)
  end

end
