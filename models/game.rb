require 'colorize'
require 'text-table'
require 'json'

require_relative 'user_database'
require_relative 'art'
require_relative '../views/records'

class Game

    STARTERS = {charmander: "fire",
                bulbasaur: "grass",
                squritle: "water"   
            }
    
    @@battle_music = Music.new('sounds/battle.mp3')

    attr_reader :game_count, :score

    def initialize(number_of_games)
        @number_of_games = number_of_games.to_i
        @game_count = 0
        @score = {player: 0, computer: 0}
        @choice = nil
        @c_choice = nil
        @@battle_music.play
    end

    def get_player_move
        puts 'Choose your starter by typing - {fire | water | grass}'.colorize(:green)
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

    def computer_wins
        @game_count += 1
        @score[:computer] += 1
    end

    def player_wins
        @game_count += 1
        @score[:player] += 1
    end
    
    def check_winner
        
        countdown

        if @choice == 'fire' && @c_choice == "water"
            #how can I turn this into a helper function
            puts "You choose... #{charmander_art}"
            puts "Computer chooses..."
            puts squirtle_art
            puts "Water beats Fire, you lose".white.on_magenta.blink
            computer_wins
        elsif @choice == 'water' && @c_choice == "grass"
            #how can I turn this into a helper function
            puts "You choose... "
            puts squirtle_art
            sleep(1)
            puts "Computer chooses..."
            puts bulbasaur_art
            sleep(1)
            puts "Grass beats Water, you lose".white.on_magenta.blink
            computer_wins
        elsif @choice == 'grass' && @c_choice == "fire"
            #how can I turn this into a helper function
            puts "You choose..."
            puts bulbasaur_art
            puts "Computer chooses..."
            puts charmander_art
            puts "Fire beats Grass, you lose".white.on_magenta.blink
            computer_wins
        elsif @choice == 'water' && @c_choice == "fire"
            #how can I turn this into a helper function
            puts "You choose... "
            puts squirtle_art
            puts "Computer chooses..."
            puts charmander_art
            puts "Water beats Fire, you win".white.on_magenta.blink
            player_wins
        elsif @choice == 'grass' && @c_choice == "water"
            #how can I turn this into a helper function
            puts "You choose... "
            puts bulbasaur_art
            sleep(1)
            puts "Computer chooses..."
            puts squirtle_art
            sleep(1)
            puts "Grass beats Water, you win".white.on_magenta.blink
            player_wins
        elsif @choice == 'fire' && @c_choice == "grass"
            #how can I turn this into a helper function
            puts "You choose... "
            puts charmander_art
            sleep(1)
            puts "Computer chooses..."
            puts bulbasaur_art
            sleep(1)
            puts "Fire beats Grass, you win".white.on_magenta.blink
            player_wins
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
        @@battle_music.stop
        STDIN.getch
    end

end