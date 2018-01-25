require_relative 'card'
require 'byebug'
class Board
  def initialize
    @grid = Array.new(4) { Array.new(4) }
    # @grid.populate
  end

  attr_reader :grid

  def grid
    @grid
  end

  def valid_guess?(pos)
    card = get_card(pos)
    if card.face == true && in_range(pos.first, pos.last)
      return false
    end
  end

  def get_card(pos)
    @grid[pos.first][pos.last]
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def populate
    2.times do
      cards = [1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8].shuffle
      @grid.each_with_index do |row, i|
        row.each_index do |col|
          card = Card.new(cards.shift)
          @grid[i][col] = card
        end
      end
    end
    @grid
  end

  def render
    @grid.each_with_index do |row, i|
      row.each_index do |col|
        if @grid[i][col].face == false
          print "[ ]"
        else
          print " #{@grid[i][col].value} "
        end
      end
      puts " "
    end
  end

  def won?
    @grid.each do |row|
      #debugger
      return false if row.any? { |el| !el.face }
    end
    true
  end
end
