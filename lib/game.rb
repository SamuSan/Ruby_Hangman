class Game
  def initialize(secret_word, player)
    @secret_word = secret_word
    @player = player
    @turns = 12       
    @won = false
  end

  def play_turn(guess)
    @turns -= 1
    result = @secret_word.check_user_guess(guess)
    result.won? ? @won = result.won? : @player.update(result)
  end

  def in_progress?
    @turns > 0 && !won?
  end
  
  private
  
  def won?
    @won
  end
end