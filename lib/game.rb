require_relative "board.rb"
require_relative "player.rb"

class Game

  attr_reader :board, :player

  def initialize
    @board = Board.new
    @player = Player.new
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
    if [board.grid[card1], board.grid[card2]].all? { |card| !card.locked }
      board.reveal_at(card1)
      board.reveal_at(card2)
    end
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
    return false unless board.grid[card1].value == board.grid[card2].value
    board.lock(card1, card2)
    true
  end

  def declare_winner
    puts "You won!"
  end


end

g = Game.new
g.play
