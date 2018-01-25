
require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end
  
  def loop_it
    i = 0
    while i < 100
      system('clear') 
      render
      @cursor.get_input
      i+=1
    end
  end
  
  def render
    puts "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _"
    puts
    @board.grid.each_with_index do |x, idx|
      x.each_with_index do |y, idy|
          if y == nil && [idx, idy] == @cursor.cursor_pos
            print "|    ".colorize(:background => :red)
          elsif y == nil && [idx, idy] != @cursor.cursor_pos
            print "|    "
          elsif y != nil && [idx, idy] == @cursor.cursor_pos
            print "| #{y}  ".colorize(:background => :red)
          elsif y != nil && [idx, idy] != @cursor.cursor_pos
            print "| #{y}  "
          end
      end
      puts "|"
      puts "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _"
      puts
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  b.populate_grid
  d = Display.new(b)
  d.render
  # d.loop_it
end