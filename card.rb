class Card
  attr_reader :value
  attr_accessor :revealed, :deck

  def initialize(value)
    @value = value
    @revealed = false
    @deck = []
  end



  def to_s
    self.revealed ? "#{value}" : "🂠"
  end


end
