require 'user_interface'
require 'message_template'

describe UserInterface do
  let(:some_text) { double }
  let(:template)  { instance_double("MessageTemplate") }
  let(:ui)        { UserInterface.new(template) }
  let(:player)    { instance_double("Player") }
  let(:result)    { Result::Unmatched.new(some_text) }

  describe "#ask_for_player_guess" do
    it "asks the user for their guess" do
      expect(template).to receive(:ask_for_player_guess).and_return(some_text)
      expect(ui).to receive(:puts).with(some_text)
      ui.ask_for_player_guess
    end
  end

  describe "#read_player_guess" do
    before do
      expect(ui).to receive(:gets).and_return(some_text)
    end

    it "reads input from the user" do
      expect(ui.read_player_guess).to eql(some_text)
    end
  end

  describe "#welcome_player" do
    it "displays a welcome message to the player" do
      expect(template).to receive(:welcome_player).and_return(some_text)
      expect(ui).to receive(:puts).with(some_text)
      ui.welcome_player
    end
  end

  describe "#report_guess_result" do
    it "reports back the correct message when the user guess was incorrect" do
      expect(template).to receive(:report_guess_result).and_return(some_text)
      expect(ui).to receive(:report_guess_result).with(result, player).and_return(template.report_guess_result(result))
      ui.report_guess_result(result, player)
    end

    it "reports back the correct message when the user guess was correct" do
      result = Result::Matched.new([0,2],some_text)
      expect(template).to receive(:report_guess_result).and_return(some_text)
      expect(ui).to receive(:report_guess_result).with(result, player).and_return(template.report_guess_result(result))
      ui.report_guess_result(result, player)
    end

    it "reports back the correct message when the user wins" do
      result = Result::Matched.new([],some_text)
      expect(template).to receive(:report_winner).and_return(some_text)
      expect(ui).to receive(:report_guess_result).with(result, player).and_return(template.report_winner)
      ui.report_guess_result(result, player)
    end
  end

  describe "#report_winner" do 
    it "reports to the player that they have won the game" do 
      expect(template).to receive(:report_winner).and_return(some_text)
      expect(ui).to receive(:puts).with(some_text)
      ui.report_winner
    end
  end
end