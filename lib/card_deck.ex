defmodule CardDeck do
  @moduledoc "A simple library for creating and manipulating a standard 52-card deck."

  alias CardDeck.Deck

  @suits [:hearts, :diamonds, :clubs, :spades]
  @ranks ~w(2 3 4 5 6 7 8 9 10 J Q K A)a

  @suit_symbols %{
    hearts: "♥",
    diamonds: "♦",
    clubs: "♣",
    spades: "♠",
    black: "🃏",
    red: "🃏"
  }

  def new_deck(include_jokers \\ false) do
    cards =
      for suit <- @suits, rank <- @ranks do
        {rank, suit}
      end

    full =
      if include_jokers do
        cards ++ [{:joker, :black}, {:joker, :red}]
      else
        cards
      end

    %Deck{cards: full}
  end

  def shuffle(%Deck{cards: cards}) do
    %Deck{cards: Enum.shuffle(cards)}
  end

  def deal(%Deck{cards: cards}, count) do
    {hand, rest} = Enum.split(cards, count)
    {hand, %Deck{cards: rest}}
  end

  def format_card({:joker, color}) do
    if color == :red, do: "🃏(R)", else: "🃏(B)"
  end

  def format_card({rank, suit}) do
    symbol = Map.get(@suit_symbols, suit, "?")
    "#{rank}#{symbol}"
  end

  def print_deck(%Deck{cards: cards}) do
    cards
    |> Enum.map(&format_card/1)
    |> Enum.chunk_every(13)
    |> Enum.each(&IO.puts(Enum.join(&1, " ")))
  end

  def reset do
    new_deck()
  end
end
