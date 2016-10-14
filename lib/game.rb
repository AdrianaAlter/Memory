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
    choices = player.choose.split(",")
    card1 = choices.first.to_i
    card2 = choices.last.to_i
    if valid?(choices)
      board.reveal_at(card1)
      board.reveal_at(card2)
    else
      player.prompt
      return
    end
    display
    unless match?(card1, card2)
      sleep(2)
      board.hide_at(card1)
      board.hide_at(card2)
    end
  end

  def valid?(choices)
    return false if choices.count != 2
    return false unless choices.all? { |choice| (0..15).cover?(choice.to_i)}
    return false if [board.grid[choices.first.to_i], board.grid[choices.last.to_i]].any? { |card| card.locked? }
    true
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
