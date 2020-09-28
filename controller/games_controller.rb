require_relative '../models/game'


def starters
    File.open("art/starters.txt").each do |line|
        puts line.light_white
    end
end

def game_sequence(game)
    begin
        game.get_player_move
        game.get_computer_move
        game.check_winner
        game.end_of_game ? game.display_winner : game.display_round_score
    end until game.end_of_game
    update_points_records(game)
    update_overall_records(game)
end

def best_of_one
    game = Game.new(1)
    game_sequence(game)
end

def best_of_three
    game = Game.new(3)
    game_sequence(game)
end

def best_of_five
    game = Game.new(5)
    game_sequence(game)
end