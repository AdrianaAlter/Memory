class Player
  attr_reader :name
  def initialize
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
    choices = choices.split(",")
    return false unless choices.count == 2
    return false unless choices.all? { |choice| (0..15).cover?(choice.to_i)}
    true
  end
end
