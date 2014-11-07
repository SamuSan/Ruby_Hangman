class UserInterface
  def initialize(message_template)
    @message_template = message_template
  end

  def welcome_player
    puts @message_template.welcome_player
  end

  def ask_for_player_guess
    puts @message_template.ask_for_player_guess
  end

  def report_guess_result(result, player)
    puts result.won? ? report_winner : @message.report_guess_result(result)
  end

  def report_current_progress
    puts message_template.report_current_progress(player)
  end

  def report_winner
    puts @message_template.report_winner
  end

  def read_player_guess
    player_guess = gets
  end
end