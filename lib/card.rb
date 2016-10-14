class Card
  attr_reader :value
  attr_accessor :revealed, :deck, :locked

  def initialize(value)
    @value = value
    @revealed = false
    @deck = []
    @locked = false
  end

  def to_s
    self.revealed ? "#{value}" : "🂠"
  end

  def locked?
    self.locked ? true : false
  end

end
