require 'rspec'
require 'board.rb'

describe Board do
  subject(:board) { Board.new }
  describe "#generate" do
    it "generates cards" do
      expect(board.grid.count).to eq(16)
      board.generate
    end
  end
  describe "#won?" do
    it "determines whether all the cards are revealed" do
      board.grid.map { |card| card.revealed = true }
      expect(board.won?).to be true
    end
  end
  describe "#reveal_at" do
    it "reveals a card" do
      board.reveal_at(0)
      expect(board.grid[0].revealed).to be true
    end
  end
  describe "#hide_at" do
    it "hides a card" do
      (0..15).to_a.each { |idx| board.reveal_at(idx) }
      board.hide_at(0)
      expect(board.grid[0].revealed).to be false
    end
  end

end
