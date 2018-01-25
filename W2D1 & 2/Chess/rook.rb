require_relative 'slidable'

class Rook < Piece
include Slidable
  
  def to_s
    'R'
  end
  
  def move_dirs
    horizontal_dirs
  end
  
end

