class MessageTemplate
  def welcome
    "This is Hang Man, you know the deal. You have 12 guesses."
  end

  def user_input_prompt
    "Enter your guess: "
  end

  def used_letters_prefix
    "Letters used: "
  end

  def correct_letters_prefix
    "Correct letters: "
  end
  
  def remaining_turns
    "Remaining turns"
  end

  def winning_game
    "You win! Well done, your Mum loves you and thinks you're special."
  end

  def losing_game(secret_word)
    "You lose. Sorry not sorry, the word was: #{secret_word}"
  end

  def result(won, secret_word)
    won ? winning_game : losing_game(secret_word) 
  end  
end