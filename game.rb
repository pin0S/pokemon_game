require 'colorize'

require_relative 'player'
require_relative 'user_database'
require_relative 'art'

class Game

    STARTERS = {charmander: "Fire", 
                squirtle: "Water", 
                bulbasaur: "Grass"
            }

    attr_reader :game_count, :score

    def initialize(number_of_games)
        @number_of_games = number_of_games.to_i
        @game_count = 0
        @score = {player: 0, computer: 0}
        @choice = nil
        @c_choice = nil
    end

    def get_player_move
        puts 'Choose your starter by typing - {fire | water | grass}'
        @choice = gets.chomp.downcase.strip
        until ['fire', 'water', 'grass'].include?(@choice)
            puts 'Not a vaild start...try again'
            @choice = gets.chomp.downcase.strip
        end
    end

    def get_computer_move
        @c_choice = STARTERS.values.sample.downcase
    end

    def countdown
        print "FIRE".colorize(:red) 
        sleep(0.5)
        print ", WATER".colorize(:blue)
        sleep(0.5)
        print ", GRASS".colorize(:green)
        sleep(0.5)
        print "...GO!\n".colorize(:yellow)
        sleep(0.2)
        puts
    end


    def check_winner
        
        countdown

        if @choice == 'fire' && @c_choice == "water"
            puts "You choose... "
            puts charmander_art
            sleep(1)
            puts "Computer chooses..."
            puts squirtle_art
            sleep(1)
            puts "Water beats Fire, you lose"
            @game_count += 1
            @score[:computer] += 1
        elsif @choice == 'water' && @c_choice == "grass"
            puts "You choose... "
            puts squirtle_art
            sleep(1)
            puts "Computer chooses..."
            puts bulbasaur_art
            sleep(1)
            puts "Grass beats Water, you lose"
            @game_count += 1
            @score[:computer] += 1
        elsif @choice == 'grass' && @c_choice == "fire"
            puts "You choose..."
            puts bulbasaur_art
            puts "Computer chooses..."
            puts charmander_art
            puts "Fire beats Grass, you lose"
            @game_count += 1
            @score[:computer] += 1
        elsif @choice == 'water' && @c_choice == "fire"
            puts "You choose... "
            puts squirtle_art
            puts "Computer chooses..."
            puts charmander_art
            puts "Water beats Fire, you win"
            @game_count += 1
            @score[:player] += 1
        elsif @choice == 'grass' && @c_choice == "water"
            puts "You choose... "
            puts bulbasaur_art
            sleep(1)
            puts "Computer chooses..."
            puts squirtle_art
            sleep(1)
            puts "Grass beats Water, you win"
            @game_count += 1
            @score[:player] += 1
        elsif @choice == 'fire' && @c_choice == "grass"
            puts "You choose... "
            puts charmander_art
            sleep(1)
            puts "Computer chooses..."
            puts bulbasaur_art
            sleep(1)
            puts "Fire beats Grass, you win"
            @game_count += 1
            @score[:player] += 1
        else
            puts "It's a draw #{@choice.capitalize} and #{@c_choice.capitalize} cancel each other out"
        end
    end
    
    def display_round_score
        puts "Player: #{@score[:player]} vs. Comp: #{@score[:computer]}"
        puts "Rounds left #{@number_of_games-@game_count}"
    end

    def end_of_game
        if @number_of_games == @game_count
            true
        end
    end

    def display_winner
        @score[:player] > @score[:computer] ? (puts "player wins #{@score[:player]} to #{@score[:computer]}") : (puts "computer wins #{@score[:computer]} to #{@score[:player]}")
        puts "PRESS ANY KEY TO RETURN TO THE MENU".colorize(:green)
        STDIN.getch
    end

end