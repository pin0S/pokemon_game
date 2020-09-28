# require_relative 'controller'
require_relative 'models/game'

def dispatch(cmd)
    unless ['1','3','5','b','s','q','r'].include?(cmd)
        puts "That is not a valid option please try again"
        cmd = gets.chomp.downcase.strip
    end

    puts `clear`
        
    case cmd
    when 'r'
        rules
        formatter
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
        formatter
    when 's'
        get_user_stats
        formatter
    end

end

