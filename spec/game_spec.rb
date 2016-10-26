require 'rspec'
require 'game.rb'
require 'card.rb'

describe Game do
  player = double("player")
  board = double("board")
  board.generate
  describe "#valid" do
    it "checks that two cards have been selected" do
      expect(game.valid?([board[0], board[1], board[2]])).to be(false)
    end
  end
end
