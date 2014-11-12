require 'message_template'

describe MessageTemplate do
  let(:template)    { MessageTemplate.new }

  describe "#welcome_player" do
    it "displays a welcome message to the user" do
      expect(template.welcome).to eq "This is Hang Man, you know the deal. You have 12 guesses."
    end
  end 

  describe "#user_input_prompt" do
    it "displays a message to the user asking for input" do
      expect(template.user_input_prompt).to eq "Enter your guess: "
    end
  end

  describe "#remaining_turns" do
    it "displays number of turns remaining" do
      expect(template.remaining_turns).to eq "Remaining turns"
    end
  end 

  describe "#used_letters_prefix" do
    it "returns a 'used letters' message prefix " do
      expect(template.used_letters_prefix).to eq "Letters used: "
    end
  end

  describe "#correct_letters_prefix" do
    it "returns a 'correct letters' message prefix" do
      expect(template.correct_letters_prefix).to eq "Correct letters: "
    end
  end

  describe "#game_result" do
    it "displays the result of the game being won" do
      expect(template.winning_game).to eq "You win! Well done, your Mum loves you and thinks you're special."
    end

    it "displays the result of a game being lost" do
      expect(template.result(false, "some_text")).to eq "You lose. Sorry not sorry, the word was: some_text"
    end
  end 
end