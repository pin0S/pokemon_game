# require_relative 'controller'
require_relative 'controller/games_controller'
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
        best_of_one
    when '3'
        best_of_three
    when '5'
        best_of_five
    when 'b'
        get_leaderboard
        formatter
    when 's'
        get_user_stats
        formatter
    end

end

