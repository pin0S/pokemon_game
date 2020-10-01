require_relative 'controller/games_controller'
require_relative 'models/game'

#The dispatch handles errors and inputs for the game sending them the controller (other part of menu feature)

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
        screen_change
        best_of_one
    when '3'
        screen_change
        best_of_three
    when '5'
        screen_change
        best_of_five
    when 'b'
        get_leaderboard
        formatter
    when 's'
        get_user_stats
        formatter
    end

end

