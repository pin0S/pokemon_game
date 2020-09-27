# require_relative 'controller'
require_relative 'game'


def dispatch(cmd)
    puts `clear`
    unless ['1','3','5','b','s','q','r'].include?(cmd)
        puts "That is not a valid option please try again"
        cmd = gets.chomp.downcase.strip
    end
        
    case cmd
    when 'r'
        rules
        STDIN.getch  #Waits for user input (Any Key)
        puts `clear` # Clears screen after
    when '1'
        game = Game.new(1)
        begin
            game.get_player_move
            game.get_computer_move
            game.check_winner
            game.end_of_game ? game.display_winner : game.display_round_score
        end until game.end_of_game
        update_points_records(game)
        update_overall_records(game)
    when '3'
        game = Game.new(3)
        begin
            game.get_player_move
            game.get_computer_move
            game.check_winner
            game.end_of_game ? game.display_winner : game.display_round_score
        end until game.end_of_game
        update_points_records(game)
        update_overall_records(game)
    when '5'
        game = Game.new(5)
        begin
            game.get_player_move
            game.get_computer_move
            game.check_winner
            game.end_of_game ? game.display_winner : game.display_round_score
        end until game.end_of_game
        update_points_records(game)
        update_overall_records(game)
    when 'b'
        get_leaderboard
        STDIN.getch  #Waits for user input (Any Key)
        puts `clear` # Clears screen after
    when 's'
        get_user_stats
        STDIN.getch  #Waits for user input (Any Key)
        puts `clear` # Clears screen after
    end

end

