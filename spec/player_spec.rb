require 'rspec'
require 'player'

describe Player do
  subject(:player) { Player.new }
  describe "#initialize" do
    it "sets a name" do
      expect(player.name).to eq("Player")
    end
  end
  describe "#prompt" do
    it "displays a message" do
      expect { player.prompt }.to output.to_stdout
    end
  end
  describe "#choose" do
    it "prompts the player" do
      expect(player).to receive(:prompt)
      player.choose
    end
  end
  # describe "#valid?" do
  #   it "checks that the player has picked two cards" do
  #     expect(player.valid?("1")).to be false
  #     expect(player.valid?("1, 2")).to be true
  #   end
  #   it "checks that the cards exist" do
  #     expect(player.valid?("0, 100")).to be false
  #     expect(player.valid?("0, 1")).to be true
  #   end
  # end
end
