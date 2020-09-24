# require_relative 'controller'
require_relative 'game'


def dispatch(cmd)
    case cmd
    when '1'
        game = Game.new(1)
        begin
            game.get_player_move
            puts game.get_computer_move
            game.check_winner
            game.end_of_game ? nil : game.display_round_score
        end until game.end_of_game
    when '3'
        game = Game.new(3)
        begin
            game.get_player_move
            puts game.get_computer_move
            game.check_winner
            game.end_of_game ? nil : game.display_round_score
        end until game.end_of_game
    when '5'
        game = Game.new(5)
        begin
            game.get_player_move
            puts game.get_computer_move
            game.check_winner
            game.end_of_game ? nil : game.display_round_score
        end until game.end_of_game
    when 'b'
        puts "leader board"
    when 's'
        puts 'stats'
    end
end

