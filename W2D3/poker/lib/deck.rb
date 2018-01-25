require_relative 'card'

class Deck

  attr_accessor :cards

  def initialize
    cards = []
    Card.suits.each do |suit|
      Card.symbols.each do |symbol|
        cards << Card.new(suit, symbol)
      end
    end

    @cards = cards
  end

  def shuffle!
    cards.shuffle!
  end

end
