class Game
  BAD_WORD_GUESS = "!"
  NUMBER_OF_TURNS = 12

  attr_reader :secret

  def initialize(secret)
    @secret = secret
    @submitted_letters = []
  end
  
  def submit_guess(guess)
    if guess.length > 1
      submit_whole_word(guess)
    else
      @submitted_letters << guess
    end
  end

  def in_progress?
    !won? && !lost?
  end

  def won?
    (@secret.word.chars - used_letters).empty?
  end

  def lost?
    number_of_guesses_remaining <= 0
  end

  def letters_filtered_by_guessed 
    @secret.word.chars.map do |letter|
      letter if used_letters.member?(letter)
    end
  end

  def number_of_guesses_remaining
    NUMBER_OF_TURNS - number_of_incorrectly_guessed_letters
  end

  def used_letters
    @submitted_letters.reject {|letter| letter == BAD_WORD_GUESS}
  end

  private

  def number_of_incorrectly_guessed_letters
    @submitted_letters.reject {|letter| @secret.word.chars.member?(letter)}.length
  end

  def submit_whole_word(guess)
    if @secret.word == guess
      @submitted_letters.concat(guess.chars.uniq)
    else
      @submitted_letters << BAD_WORD_GUESS
    end
  end 
end