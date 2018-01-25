class Card

  SUITS = [:hearts, :diamonds, :clubs, :spades]
  SYMBOLS = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]

  attr_reader :suit, :symbol

  def initialize(suit, symbol)
    @suit = suit
    @symbol = symbol
  end

  def self.suits
    SUITS
  end

  def self.symbols
    SYMBOLS
  end

end
