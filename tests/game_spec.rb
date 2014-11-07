require 'game'
require 'player'     
require 'secret_word'

describe Game do
  let(:word_length) { double }
  let(:some_text)   {double}
  let(:secret_word) { instance_double("SecretWord") }
  let(:player)      { instance_double("Player") }
  let(:game)        { Game.new(secret_word, player) }
  let(:result)      { Result::Unmatched.new(some_text) }

  describe "#in_progress" do
    it "is false when 12 turns have been  taken" do
      expect(secret_word).to receive(:check_user_guess).at_least(:once).with(some_text).and_return(result)
      expect(player).to receive(:update).at_least(:once).with(result)
      13.times { game.play_turn(some_text) }
      expect(game.in_progress?).to be false
    end

    it "is true when less than 12 turns have been  taken" do
      expect(secret_word).to receive(:check_user_guess).at_least(:once).with(some_text).and_return(result)
      expect(player).to receive(:update).at_least(:once).with(result)
      game.play_turn(some_text) 
      expect(game.in_progress?).to be true
    end 
  end
end