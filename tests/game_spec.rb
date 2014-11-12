require 'game'
require 'secret'

describe Game do
  let(:word_length) { double }
  let(:some_text)   { double }
  let(:chars)       { double }
  let(:secret)      { instance_double("SecretWord") }
  let(:game)        { Game.new(secret) }

  describe "#submit_guess" do
    it "keeps track of the single letters the player has used" do
      game.submit_guess("d")
      expect(game.used_letters).to eq ["d"]
    end

    it "adds all letters from a corect word guess to the used letters" do
      expect(secret).to receive(:word).and_return("sauce")
      game.submit_guess("sauce")
      expect(game.used_letters).to eq ["s", "a", "u", "c", "e"]
    end

    it "adds no letters from an incorect word guess to the used letters" do
      expect(secret).to receive(:word).and_return("sauce")
      game.submit_guess("ghost")
      expect(game.used_letters).to be_empty
    end    
  end

  describe "#in_progress?" do
    it "should be false when we haven't guess the word" do
      expect(secret).to receive(:word).at_least(:once).and_return("Sauce")
      game.submit_guess("x")
      expect(game).to be_in_progress
    end

    it "should be false when we have guessed the word" do
      expect(secret).to receive(:word).at_least(:once).and_return("sauce")
      game.submit_guess("sauce")
      expect(game).to_not be_in_progress
    end
  end

  describe "#letters_filtered_by_guessed" do
    it "returns an array with the correctly guessed letters in the correct positions and nil everywhere else" do
      expect(secret).to receive(:word).at_least(:once).and_return("sauce")
      game.submit_guess("s")
      game.submit_guess("u")
      expect(game.letters_filtered_by_guessed).to eq(["s", nil, "u", nil, nil])
    end
  end

  describe "#secret.word" do
    it "returns the secret word from secret" do
      expect(secret).to receive(:word).and_return(some_text)
      expect(game.secret.word).to eq some_text    
    end  
  end

  describe "#number_of_guesses_remaining" do
    subject { game.number_of_guesses_remaining }

    context "when the game is new" do
      it { is_expected.to be 12 }
    end

    context "when one incorrect guess has been made" do
      before do
        expect(secret).to receive(:word).and_return(some_text)
        expect(some_text).to receive(:length).and_return(1)
        expect(some_text).to receive(:chars).and_return(chars)
        expect(chars).to receive(:member?).and_return(false)
        game.submit_guess(some_text) 
      end

      it { is_expected.to be 11 }
    end

    context "when a correct one letter guess has been made" do
      before do
        expect(secret).to receive(:word).and_return(some_text)
        expect(some_text).to receive(:length).and_return(1)
        expect(some_text).to receive(:chars).and_return(chars)
        expect(chars).to receive(:member?).and_return(true)
        game.submit_guess(some_text) 
      end
      
      it {is_expected.to be 12}
    end
    
    context "when an incorrect whole word guess has been made" do
      before do 
        expect(secret).to receive(:word).exactly(2).and_return("nono")
        expect(some_text).to receive(:length).and_return(4)
        game.submit_guess(some_text)
      end

      it {is_expected.to be 11} 
    end
  end
end