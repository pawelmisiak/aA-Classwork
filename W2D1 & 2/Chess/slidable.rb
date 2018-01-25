require 'byebug'
module Slidable
  HORIZONTAL_DIRS = [[1,0], [-1,0], [0,1], [0,-1]]
  DIAGONAL_DIRS = [[1,1], [1,-1], [-1,1], [-1,-1]]
  
  def horizontal_dirs
    HORIZONTAL_DIRS
  end
  
  def diagonal_dirs 
    DIAGONAL_DIRS 
  end
  
  def moves
    arr = []
    move_dirs.each do |diff|
      arr += grow_unblocked_moves_in_dir(diff[0], diff[1])
    end
    arr
  end
  
  def grow_unblocked_moves_in_dir(dx, dy)
    debugger
    arr = []
    current_pos = [@position[0] + dx, @position[1] + dy]
    # next_pos = [(current_pos[0] + diff[0]), (current_pos[1] + diff[1])]
    while @board.valid_move?(current_pos)
      if @board[current_pos] == nil 
        arr << current_pos
        # update current pos
        current_pos[0] += dx
        current_pos[1] += dy
      elsif @board[current_pos].color == @color
        break
      elsif @board[current_pos].color != @color
        arr << current_pos
        break
      end 
    end
    arr
  end  
end