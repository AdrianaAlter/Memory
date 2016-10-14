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

end
