class Game

    def initalize(number_of_games)
        @number_of_games = number_of_games
    end

    def check_winner(choice, c_choice)
        if choice == 'fire' && c_choice == "water"
            puts "Water beats fire, you lose"
        elsif choice == 'water' && c_choice == "grass"
            puts "Grass beats water, you lose"
        elsif choice == 'grass' && c_choice == "fire"
            puts "Fire beats grass, you lose"
        elsif choice == 'water' && c_choice == "fire"
            puts "Water beats fire, you win"
        elsif choice == 'grass' && c_choice == "water"
            puts "Grass beats water, you win"
        elsif choice == 'fire' && c_choice == "grass"
            puts "Fire beats grass, you win"
        else
            puts "It's a draw #{choice} and #{c_choice} cancel each other out"
        end
    end
end