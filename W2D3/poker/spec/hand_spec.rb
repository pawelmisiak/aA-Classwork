require 'rspec'
require 'hand'
require 'card'


describe Hand do

  describe "#pair" do
    let(:card1) {Card.new(:hearts, :ace)}
    let(:card2) {Card.new(:clubs, :two)}
    let(:card3) {Card.new(:clubs, :three)}
    let(:card4) {Card.new(:diamonds, :five)}
    let(:card5) {Card.new(:spades, :two)}
    let(:hand) {Hand.new([card1, card2, card3, card4, card5])}

    it "returns the pair of cards" do
      expect(hand.pair(hand.hand)).to eq([:two])
    end

  end

  describe "#straight" do
    let(:card1) {Card.new(:hearts, :ace)}
    let(:card2) {Card.new(:clubs, :two)}
    let(:card3) {Card.new(:clubs, :three)}
    let(:card4) {Card.new(:diamonds, :five)}
    let(:card5) {Card.new(:spades, :four)}
    let(:hand) {Hand.new([card1, card2, card3, card4, card5])}

    it "returns the straight" do
      expect(hand.straight(hand.hand)).to be true
    end

  end

end
