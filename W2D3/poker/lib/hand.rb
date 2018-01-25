require_relative 'deck'

class Hand

  attr_reader :hand

  def initialize(array_of_five)
    @hand = array_of_five
    @best_hand = :high_card
  end

  def evaluate_hand(hand)
    counter = Hash.new(0)

    hand.each { |card| counter[card.symbol] += 1 }
    counter
  end

  def pair(hand)
    counter = evaluate_hand(hand)
    pairs = counter.select {|k,v| counter[k] == 2}
    return false if pairs.empty?
    pairs.keys
  end

  def two_pair(hand)
    pairs = pair(hand)
    return false if pairs.length < 2
    pairs
  end

  def three_of_a_kind(hand)
    counter = evaluate_hand(hand)
    three = counter.select {|k,v| counter[k] == 3}
    return false if three.empty?
    three
  end

  def straight(hand)
    symbols = Card.symbols.dup
    symbols.unshift(:ace)
    sequence = []

    hand.each {|card| sequence << symbols.index(card.symbol)}

    sequence = sequence.sort

    sequence == (sequence.min..sequence.max).to_a

  end

  def flush(hand)
    suits = []
    hand.each {|card| suits << card.suit}

    return false unless suits.uniq == 1
    hand
  end

  def full_house?

  end

  def four_of_a_kind?

  end

  def straight_flush?

  end

end
