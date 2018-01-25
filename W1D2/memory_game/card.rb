class Card
  attr_accessor :card
  attr_accessor :face, :value
  cards = [1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8].shuffle

  def initialize(card)
    @value = card
    @face = false
  end

  def reveal
    @face = true
    display
  end

  def hide
    @face = false
  end

  def display
    puts @face
  end

  def to_s
    @value
  end

  def value
    @value
  end

  def ==(value)
    @value == value
  end

end
