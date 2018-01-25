require_relative 'piece'
require_relative 'rook'


class Board 
  attr_reader :grid
  
  def initialize
    @grid = Array.new(8) {Array.new(8)}
  end
  
  def populate_grid
    # i = 0
    # j = 0
    # k = 6
    # h = 0
    # 16.times do
    #   @grid[i][j] = Piece.new(:black, self, [i,j])
    #   j += 1
    #   if j == 8
    #     j = 0 
    #     i =1
    #   end
    #   @grid[k][h] = Piece.new(:white, self, [i,j])
    #   h += 1
    #   if h == 8
    #     h = 0 
    #     k = 7
    #   end  
    # end
    @grid[0][0] = Rook.new(:black, self, [0,0])
  end
  
  
  
  def move_piece(start_pos, end_pos)
    if self[start_pos] == nil 
      raise NoPieceError 
    elsif valid_move?(end_pos) == false
      raise InvalidMoveError 
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = nil
    end
    
  end
  
  def valid_move?(pos)
    (0..7).include?(pos[0]) && (0..7).include?(pos[1])
  end
  
  def [](pos)
    row, column = pos
    @grid[row][column]
  end
  
  def []=(pos, mark)
    row, column = pos
    @grid[row][column] = mark
  end
end

class InvalidMoveError < StandardError
  def message
    "Your move is not on the board."
  end
  
end

class NoPieceError < StandardError
  def message
    "There is no piece in that space."
  end
  
end