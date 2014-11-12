require 'secret'

describe Secret do
  let(:some_text)             { double }
  let(:secret)                { Secret.new }

	describe "#initialize" do
    before do
      expect(secret).to receive(:secret).at_least(:once).and_return some_text
    end

	  it "selects a secret word from the input file" do
      expect(secret.secret).to eq some_text
	  end
  end
end