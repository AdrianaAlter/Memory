require 'rspec'
require 'card.rb'

describe Card do
  subject(:card) { Card.new("A")}
  describe "#initialize" do
    it "sets a value" do
      expect(card.value).to eq("A")
    end
    it "is not revealed" do
      expect(card.revealed).to be false
    end
  end
end
