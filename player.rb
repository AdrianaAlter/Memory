class Player
  attr_reader :name
  def initialize(name)
    @name = "Player"
  end

  def prompt
    puts "Choose two cards."
  end

  def choose
    prompt
    choices = gets.chomp
  end

  def valid?(choices)
    choices.split.count == 2 && choices.all? { |choice| (0..15).cover?(choice.to_i)}
  end
end
