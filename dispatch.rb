# require_relative 'controller'
require_relative 'game'


def dispatch(cmd)
    case cmd
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
    when 's'
        get_user_stats
    else
        unless cmd.include?(['1','3','5','b','s','q'])
            puts "That is not a valid option please try again"
            cmd = gets.chomp.downcase.strip 
        end
    end
end

