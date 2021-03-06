require 'colorize'
require 'text-table'
require 'json'

require_relative 'user_database'
require_relative 'art'
require_relative '../views/records'

#Game class

class Game

    #constant for computer to make random choice from
    STARTERS = {charmander: "fire",
                bulbasaur: "grass",
                squritle: "water"   
            }
    
    # The game music is a bonus feature to the application
    @@battle_music = Music.new('sounds/battle.mp3')

    attr_reader :game_count, :score, :number_of_games

    #initalize all game requirements

    def initialize(number_of_games=0)
        @number_of_games = number_of_games.to_i
        @game_count = 0
        @score = {player: 0, computer: 0}
        @choice = nil
        @c_choice = nil
        @@battle_music.play
    end


    def get_player_move

        #gets players move and checks if it is valid choice

        puts 'Choose your starter by typing - {fire | water | grass}'.colorize(:green)
        @choice = gets.chomp.downcase.strip
        until ['fire', 'water', 'grass'].include?(@choice)
            puts 'Not a vaild start...try again'.colorize(:red)
            @choice = gets.chomp.downcase.strip
        end
    end

    def get_computer_move
        #get computer move from STARTERS constant      

        @c_choice = STARTERS.values.sample.downcase
    end

    def countdown
        #simulate rock, paper, scissors go! like in real life game

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
        #add to game count and computer points score

        @game_count += 1
        @score[:computer] += 1
    end

    def player_wins
         #add to game count and player points score

        @game_count += 1
        @score[:player] += 1
    end

    def check_winner
         #call count down function for each game
        countdown

        #conditional logic to see who wins, plus ascii art pokemon print
        if @choice == 'fire' && @c_choice == "water"
            puts "You choose... #{charmander_art}"
            puts "Computer chooses..."
            puts squirtle_art
            puts "Water beats Fire, you lose".white.on_magenta.blink
            computer_wins
        elsif @choice == 'water' && @c_choice == "grass"
            puts "You choose... "
            puts squirtle_art     
            puts "Computer chooses..."
            puts bulbasaur_art
            puts "Grass beats Water, you lose".white.on_magenta.blink
            computer_wins
        elsif @choice == 'grass' && @c_choice == "fire"
            puts "You choose..."
            puts bulbasaur_art
            puts "Computer chooses..."
            puts charmander_art
            puts "Fire beats Grass, you lose".white.on_magenta.blink
            computer_wins
        elsif @choice == 'water' && @c_choice == "fire"
            puts "You choose... "
            puts squirtle_art
            puts "Computer chooses..."
            puts charmander_art
            puts "Water beats Fire, you win".white.on_magenta.blink
            player_wins
        elsif @choice == 'grass' && @c_choice == "water"
            puts "You choose... "
            puts bulbasaur_art
            puts "Computer chooses..."
            puts squirtle_art
            puts "Grass beats Water, you win".white.on_magenta.blink
            player_wins
        elsif @choice == 'fire' && @c_choice == "grass"
            puts "You choose... "
            puts charmander_art
            puts "Computer chooses..."
            puts bulbasaur_art
            puts "Fire beats Grass, you win".white.on_magenta.blink
            player_wins
        else
            puts
            puts "It's a draw #{@choice.capitalize} and #{@c_choice.capitalize} cancel each other out"
            puts
        end
    end
    
    def display_round_score
        #displays computer vs. player score for each round
        puts "Player: #{@score[:player]} vs. Comp: #{@score[:computer]}"
        puts "Rounds left #{@number_of_games-@game_count}"
    end

    def end_of_game
        #Check if the game is over
        if @number_of_games == @game_count
            true
        end
    end

    def display_winner
        #stop game music
        @@battle_music.stop
        #conditional logic to see who won and to then make corressponding sound and output
        if @score[:player] > @score[:computer]
            win=Sound.new('sounds/win.wav')
            win.play
            puts "\nPlayer wins #{@score[:player]} to #{@score[:computer]}".colorize(:green) 
        else
            lose=Sound.new('sounds/lose.mp3') 
            lose.play
            puts "\nComputer wins #{@score[:computer]} to #{@score[:player]}".colorize(:red) 
        end
        #get any key to return to menu at conclusion of game
        puts "\nPRESS ANY KEY TO RETURN TO THE MENU".colorize(:green)
        STDIN.getch
    end

end