
require_relative "card.rb"

class Board
  attr_accessor :grid, :deck

  def initialize
    @grid = []
    generate
  end

  def generate
    a = ["A","B","C","D","E","F","G","H"]
    2.times do
      a.shuffle.each do |letter|
          grid << Card.new(letter)
      end
    end
  end

  def render
    puts grid[0..3].each { |card| card.to_s }.join(" ")
    puts grid[4..7].join(" ")
    puts grid[8..11].join(" ")
    puts grid[12..15].join(" ")
  end

  def won?
    grid.none? { |card| card.revealed == false }
  end

  def reveal_at(idx)
    grid[idx].revealed = true
    grid[idx].to_s
  end

  def hide_at(idx)
    grid[idx].revealed = false
    grid[idx].to_s
  end

end
