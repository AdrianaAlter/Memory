require_relative "board.rb"
require_relative "player.rb"

class Game

  attr_reader :board, :player

  def initialize
    @board = Board.new
    @player = Player.new("Player")
  end

  def play

    until board.won?
      play_round
    end
    declare_winner

  end

  def play_round
      display
      choice = player.choose.split(",")
      card1 = choice.first.to_i
      card2 = choice.last.to_i
      board.reveal_at(card1)
      board.reveal_at(card2)
      display
      unless match?(card1, card2)
        sleep(2)
        board.hide_at(card1)
        board.hide_at(card2)
      end
  end


  def display
    system("clear")
    board.render
  end

  def match?(card1, card2)
    board.grid[card1].value == board.grid[card2].value
  end

  def declare_winner
    puts "You won!"
  end


end

g = Game.new
g.play
