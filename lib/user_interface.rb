class UserInterface
  def initialize(game, message_template)
    @game = game
    @message_template = message_template
  end

  def welcome_player
    puts @message_template.welcome
  end

  def ask_for_player_guess
    puts @message_template.user_input_prompt
  end

  def display_remaining_turns
    puts "#{@message_template.remaining_turns} #{@game.number_of_guesses_remaining}"
  end

  def display_used_letters
    puts "#{@message_template.used_letters_prefix} #{@game.used_letters.join(" ")}"
  end

  def display_correct_letters
    puts "#{@message_template.correct_letters_prefix} #{word_with_hidden_unguessed_letters(@game.letters_filtered_by_guessed)}"
  end

  def display_game_result
    puts @message_template.result(@game.won?, @game.secret.word)
  end

  def read_player_guess
    gets.chomp
  end

  private

  def word_with_hidden_unguessed_letters(correct_letters)
    correct_letters.map {|letter| letter || "?"}.join
  end
end