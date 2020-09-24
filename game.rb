class Game

    STARTERS = {Charmander: "Fire", 
                Squirtle: "Water", 
                Bulbasaur: "Grass"
            }

    attr_reader :game_count

    def initialize(number_of_games)
        @number_of_games = number_of_games.to_i
        @game_count = 0
        @score = {player: 0, computer: 0}
        @choice = nil
        @c_choice = nil
    end

    def get_player_move
        puts 'Choose your starter - {fire | water | grass}'
        @choice = gets.chomp.downcase.strip
    end

    def get_computer_move
        @c_choice = STARTERS.values.sample.downcase
    end


    def check_winner
        if @choice == 'fire' && @c_choice == "water"
            puts "Water beats fire, you lose"
            @game_count += 1
            @score[:computer] += 1
        elsif @choice == 'water' && @c_choice == "grass"
            puts "Grass beats water, you lose"
            @game_count += 1
            @score[:computer] += 1
        elsif @choice == 'grass' && @c_choice == "fire"
            puts "Fire beats grass, you lose"
            @game_count += 1
            @score[:computer] += 1
        elsif @choice == 'water' && @c_choice == "fire"
            puts "Water beats fire, you win"
            @game_count += 1
            @score[:player] += 1
        elsif @choice == 'grass' && @c_choice == "water"
            puts "Grass beats water, you win"
            @game_count += 1
            @score[:player] += 1
        elsif @choice == 'fire' && @c_choice == "grass"
            puts "Fire beats grass, you win"
            @game_count += 1
            @score[:player] += 1
        else
            puts "It's a draw #{@choice} and #{@c_choice} cancel each other out"
        end
    end
    
    def check_score
      puts "Player: #{@score[:player]}"
      puts "Comp: #{@score[:computer]}"
    end

    def end_of_game
        if @number_of_games == @game_count
            true
        end
    end

    def display_winner
        @score[:player] > @score[:computer] ? (puts "player wins #{@score[:player]} to #{@score[:computer]}") : (puts "computer wins #{@score[:computer]} to #{@score[:player]}")
    end
end


game = Game.new("3")
begin
    game.get_player_move
    puts game.get_computer_move
    game.check_winner
    puts game.game_count
end until game.end_of_game
game.display_winner