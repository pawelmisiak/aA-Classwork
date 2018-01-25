require 'rspec'
require 'card'

describe Card do

  describe "#initialize" do
    let (:card) { Card.new(:spades, :ace)}

    it "initializes card with a suit and symbol" do
      expect(card.suit).to eq(:spades)
      expect(card.symbol).to eq(:ace)
    end
  end
end 
