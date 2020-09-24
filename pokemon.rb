# welcome screen

puts
puts "Welcome to Pokemon Rumble, a game of fire, water, grass"
puts 5.times{print"---------"}
#menu display

begin
    print  "What would you like to do Trainer? - options {best of 3 (3) | best of 5 (5) | see leader board (b) | see your scores and stats (s) | quit (q)"
    input = gets.chomp.downcase.strip
    cmd = input
end until 'q' == cmd


#rules

# puts "The rules are as follows"
# puts "1. Pick your starter"
# puts "2. Fire beats grass, grass beats water, water beats fire"
# puts

# games class

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
