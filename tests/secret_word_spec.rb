require 'secret_word'
require 'result'

describe SecretWord do
  let(:some_text)             { double }
  let(:secret_word)           { SecretWord.new }
  let(:result_matched)        { instance_double("Result::Matched") }
  let(:result_unmatched)      { instance_double("Result::Unmatched") }

	describe "#initialize" do
    before do
      expect(secret_word).to receive(:secret_word).at_least(:once).and_return some_text
    end

	  it "selects a secret word from the input file" do
      expect(secret_word.send(:secret_word)).to eq some_text
	  end
	end

  describe "#check_whole_word_guess" do
    before do 
      expect(secret_word).to receive(:check_whole_word_guess).with(some_text).and_return(result_matched)
    end

    it "returns true result if the word is the secret_word" do
      expect(secret_word.send(:check_whole_word_guess, some_text)).to eq result_matched
    end
  end
end