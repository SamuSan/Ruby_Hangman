require_relative 'game'
require_relative 'user_interface'
require_relative 'message_template'
require_relative 'secret'

message_template  = MessageTemplate.new
secret            = Secret.new
game              = Game.new(secret)
ui                = UserInterface.new(game, message_template)

ui.welcome_player

loop do
  ui.display_remaining_turns
  
  ui.ask_for_player_guess 
  game.submit_guess(ui.read_player_guess)
  
  break unless game.in_progress?
  
  ui.display_used_letters
  ui.display_correct_letters
end

ui.display_correct_letters
ui.display_game_result