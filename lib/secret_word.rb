require_relative 'result'

class SecretWord
  WORDS_FILE_PATH = "#{File.dirname(__FILE__)}/../data/words.txt"

  def initialize
    @secret_word = File.read(WORDS_FILE_PATH).split.sample
  end

  def check_user_guess(guess)
    guess.size > 1 ? check_whole_word_guess(guess) : check_single_letter_guess(guess)
  end

  def secret_word_size 
    @secret_word.size  
  end

  private

  def check_whole_word_guess(word)
    word.eql?(secret_word) ? Result::Matched.new([], word) : Result::Unmatched.new(word)
  end

  def check_single_letter_guess(letter)
    indices = Array.new
    secret_word.each_char { |x| indices.push(secret_word.index(x)) if x == letter } 
    indices.empty? ? Result::Unmatched.new(letter) : Result::Matched.new(indices, letter)
  end

  def secret_word
    @secret_word
  end
end
