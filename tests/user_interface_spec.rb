require 'user_interface'
require 'message_template'

describe UserInterface do
  let(:some_array)  { ["s", nil, "u", nil , nil] } 
  let(:some_text)   { "dummy" }
  let(:some_number) { 1 }
  let(:secret)      { instance_double("SecretWord") }
  let(:game)        { instance_double("Game") }
  let(:template)    { instance_double("MessageTemplate") }
  let(:ui)          { UserInterface.new(game, template) }

  describe "#welcome_player" do
    it "displays the welcome message to the player" do
      expect(template).to receive(:welcome).and_return(some_text)
      expect(ui).to receive(:puts).with(some_text)
      ui.welcome_player
    end
  end

  describe "#ask_for_player_guess" do
    it "asks the user for their guess" do
      expect(template).to receive(:user_input_prompt).and_return(some_text)
      expect(ui).to receive(:puts).and_return(some_text)
      ui.ask_for_player_guess
    end
  end

  describe "display_remaining_turns" do
    it "displays the number of turns remaining" do
      expect(template).to receive(:remaining_turns).and_return(some_text)
      expect(game).to receive(:number_of_guesses_remaining).and_return(some_number)
      expect(ui).to receive(:puts).and_return(some_text)    
      ui.display_remaining_turns
    end  
  end

  describe "#display_correct_letters" do
    it "displays the letters correcrtly guessed thus far" do
      expect(template).to receive(:correct_letters_prefix).and_return(some_text)
      expect(game).to receive(:letters_filtered_by_guessed).and_return(some_array)
      expect(ui).to receive(:puts).and_return(some_text)
      ui.display_correct_letters
    end
  end

  describe "#display_used_letters" do
    it "displays the current the result of all guesses up to this point" do
      expect(template).to receive(:used_letters_prefix).and_return(some_text)
      expect(game).to receive(:used_letters).and_return(some_array)
      expect(ui).to receive(:puts).and_return(some_text)
      ui.display_used_letters
    end
  end

  describe "#display_game_result" do
    it "#displays the result of the game when the player wins" do
      expect(template).to receive(:result).with(true, "sauce").and_return(some_text)
      expect(game).to receive(:won?).and_return(true)
      expect(game).to receive(:secret).and_return(secret)
      expect(secret).to receive(:word).and_return("sauce")
      expect(ui).to receive(:puts).and_return(some_text)
      ui.display_game_result
    end

    it "#displays the result of the game when the player loses" do
      expect(template).to receive(:result).with(false, "sauce").and_return(some_text)
      expect(game).to receive(:won?).and_return(false)
      expect(game).to receive(:secret).and_return(secret)
      expect(secret).to receive(:word).and_return("sauce")
      expect(ui).to receive(:puts).and_return(some_text)
      ui.display_game_result
    end
  end
  
  describe "#read_player_guess" do
    it "#reads input from the user" do
      expect(ui).to receive(:gets).and_return("xx")
      expect(ui.read_player_guess).to eq "xx"
    end
  end
end