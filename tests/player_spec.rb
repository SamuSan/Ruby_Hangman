require 'player'

describe Player do
  let(:player) {Player.new(5)}

  describe "#initialize" do
    it "creates a Player object with no correct letters" do
      expect(player.correct_letters).to eq "_____"
    end
  end

  describe "#update" do
    it "records the letter correctly guessed by the user" do
      result = Result::Matched.new([0,2], "d")
      player.update(result)
      expect(player.correct_letters).to eql ("d_d__")      
    end

    it "records the letters already used by the user" do
      result = Result::Matched.new([0,2], "d")
      player.update(result)
      expect(player.used_letters).to eql ("d")      
    end
  end
end