# require 'colorize'

class Array
  def my_uniq
    arr = []
    self.each do |el|
      arr << el unless arr.include?(el)
    end
    arr
  end


  def two_sum
    pairs = []

    self.length.times do |i|
      j = self.length - 1

      self.length.times do
        if self[i] + self[j] == 0 && j > i
          pairs << [i, j] unless self[i] == 0 || self[j] == 0
        end
        j -= 1
      end
    end

    pairs
  end

  def my_transpose
    array = []
    i = 0

    while i < self.length
      sub_array = []

      self.each do |array|
        sub_array << array[i]
      end

      array << sub_array
      i += 1
    end

    array
  end

  def stock_picker
    return [] if self.sort == self.reverse
    pairs = self.combination(2).to_a

    sorted = pairs.sort_by {|pair| pair.last - pair.first}

    biggest_profit = sorted.last

    days  = []

    biggest_profit.each {|amount| days << self.index(amount)}

    days
  end

end

class Array
  def deep_dup
    new_array = []
    self.each do |el|
      new_array << (el.is_a?(Array) ? el.deep_dup : el)
    end
    new_array
  end
end

class InvalidMoveError < StandardError; end


class TowersOfHanoi
  attr_reader :player
  attr_accessor :board

  def initialize(player)
    @player = player
    @board = [[1,2,3],[],[]]
  end

  def move(start, finish)
    unless start.between?(0,2) && finish.between?(0,2)
      raise InvalidMoveError
    end
    raise InvalidMoveError if self.board[start].empty?
    unless self.board[finish].empty?
      raise InvalidMoveError if self.board[start].first > self.board[finish].first
    end
    self.board[finish].unshift(self.board[start].shift)
  end

  def play
    render

    until won?
      begin
        puts "Enter starting tower, #{player} (1,2,3)"
        start = gets.chomp.to_i - 1
        puts "Enter ending tower, #{player} (1,2,3)"
        finish = gets.chomp.to_i - 1
        move(start,finish)
      rescue InvalidMoveError
        puts "That move is no good"
        sleep(2)
        system('clear')
        render
        retry
      end
      render
    end

    sleep(1.5)
    puts "Congrats! you done!"
    sleep(1)
    puts " #{player} is good,".blue
    sleep(1)
    10.times do
      puts "#{player} is great.".red
      sleep(0.5)
      puts "#{player} is great.".yellow
      sleep(0.5)
      puts "#{player} is great.".green
      sleep(0.5)
      puts "#{player} is great.".magenta
      sleep(0.5)
      puts "#{player} is great.".cyan
      sleep(0.5)
      puts "#{player} is great.".blue
    end
    exit
  end

  def render
    system('clear')
    safety_copy = board.deep_dup
    safety_copy.each do |tower|
      while tower.length < 3
        tower.unshift(0)
      end
    end
    transposed = safety_copy.transpose

    transposed.each do |line|
      line.each do |char|
        print " #{char}"
      end
      puts "\n"
    end
  end

  def won?
    board[1..2].any? {|tower| tower.length == 3}
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "Welcome to Towers of Hanoi!"
  sleep(0.5)
  puts "What is your name?"
  name = gets.chomp
  sleep(1)

  if name == "Bob"
    puts "THAT'S MY FAVORITE NAME."
    sleep(2)
  else
    puts "#{name} is an okay name."
    sleep(1)
    puts "BUT HAVE YOU HEARD THE NAME BOB?!"
    sleep(1)
    puts "I'm gonna call you Bob."
    name = "Bob"
    sleep(2)
  end
  puts "Let's play!"
  sleep(1)

  game = TowersOfHanoi.new(name)
  game.play
end
