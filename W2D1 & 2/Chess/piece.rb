require_relative 'board'

class Piece
  attr_reader :position
  
  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
  end
  
  def valid_moves
    
  end
  
  
  
  def to_s
    'P'
  end
end