require_relative 'board'
require_relative 'player'
class Game
  attr_accessor :board, :player1, :player2

  def initialize
    @board = Board.new
    @board.populate
    @player1 = HumanPlayer.new("Pawel")
    @player2 = ComputerPlayer.new("PB&J")
    @currentplayer = @player1
  end

  def play
    until over?
      play_turn
      switch_players
    end
    puts "You won!"
  end

  def play_turn
    system("clear")
    @board.render
    pos1 = @currentplayer.get_guess
    @board.render
    pos2 = @currentplayer.get_guess
    @board.render
    if !make_guess(pos1, pos2)
      @currentplayer.get_card(pos1).face = false
      @currentplayer.get_card(pos2).face = false
      puts "Those cards didn't match."
    else
      puts "That was a match!"
    end
    sleep(3)
  end

  def switch_players
    if @currentplayer == @player1
      @currentplayer = @player2
    else
      @currentplayer = @player1
    end
  end

  def make_guess(pos1, pos2)
    @currentplayer.get_card(pos1).value == @currentplayer.get_card(pos2).value
  end

  def get_card(pos)
    @board.grid[pos.first][pos.last]
  end

  def over?
    @board.won?
  end
end

if __FILE__ == $PROGRAM_NAME
  player1 = ComputerPlayer.new
  player2 = HumanPlayer.new("George")
  g = Game.new(player1, player2)
  g.play
end
