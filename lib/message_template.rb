class MessageTemplate
  INPUT_PROMPT    = "Enter your guess:"
  WELCOME_PLAYER  = "This is Hang Man, you know the deal. You have 12 guesses."
  WINNING_GUESS   = "You win! Well done, your Mum loves you and thinks you're special"
  CORRECT_GUESS   = "Your guess was correct!"
  INCORRECT_GUESS = "Your guess was incorrect, try again."

  def ask_for_player_guess
    INPUT_PROMPT
  end

  def welcome_player
    WELCOME_PLAYER
  end 

  def report_guess_result(result) 
    result.matched? ? CORRECT_GUESS : INCORRECT_GUESS
  end

  def report_current_progress(player)
    "Letters already used : #{player.used_letters.join(" ")}\n\n#{player.report_current_progress}"
  end

  def report_winner
    WINNING_GUESS
  end  
end