class Secret
  WORDS_FILE_PATH = "#{File.dirname(__FILE__)}/../data/words.txt"

  attr_reader :word
  
  def initialize
    @word = File.read(WORDS_FILE_PATH).split.sample
  end
end
