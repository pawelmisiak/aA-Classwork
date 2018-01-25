require_relative 'board'
require_relative 'card'
require 'byebug'
class HumanPlayer
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def get_guess
    puts "Choose a position"
    pos = gets.chomp.delete(" ")
    pos = pos.chars.map {|el| el.to_i }
    p pos
    until valid_guess?(pos)
      pos = get_guess
    end

    get_card(pos).face = true
    pos
  end

  def valid_guess?(pos)
    card = Board.get_card(pos)
    if card.face == true && in_range(pos.first, pos.last)
      return false
    end
  end

  def in_range(first, last)
    first >= 0 && first <= 3 && last >= 0 && last <= 3
  end

  # def get_card(pos)
  #   @board[pos.first][pos.last]
  #   #@board.grid[pos.first][pos.last]
  # end
end

class ComputerPlayer
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def get_guess
    pos = [rand(0..3), rand(0..3)]
    until valid_guess?(pos)
      pos = get_guess
    end
    pos
  end

  def valid_guess?(pos)
    card = get_card(pos)
    if card.face == true && in_range(pos.first, pos.last)
      return false
    end
    true
  end

  def in_range(first, last)
    first >= 0 && first <= 3 && last >= 0 && last <= 3
  end

  def get_card(pos)
    @board.grid[pos.first][pos.last]
  end
end
