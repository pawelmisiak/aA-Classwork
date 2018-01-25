require 'rspec'
require 'deck'
require 'card'

describe Deck do
  subject(:deck) { Deck.new }

  describe "#initialize" do

    it "initializes with a deck of 52 distinct playing cards" do
      expect(deck.cards.length).to eq(52)
      expect(deck.cards).to eq(deck.cards.uniq)
      expect(deck.cards[10]).to be_an_instance_of(Card)
    end

    it "initializes unshuffled" do
      expect(deck.cards[0].symbol).to eq(:two)
      expect(deck.cards[0].suit).to eq(:hearts)
    end
  end

  describe "shuffle!" do

    it "shuffles the deck" do
      expect(deck).not_to eq (deck.shuffle!)
    end
  end


end
