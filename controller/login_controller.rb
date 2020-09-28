require_relative '../models/user_database'

#I want to use these functions to clean up my code - how do I send username and pin back to the loop in games.rb
def new_user(username, pin)
    puts
    puts "Please pick a username?"
    username = gets.chomp.downcase.strip
    puts "Please pick a 4 digit pin? (make sure you remember it!)"
    pin = gets.chomp.strip
    unless pin.length == 4
        puts "Pin is not 4 digits...re-enter: "
        pin = gets.chomp.strip
        puts `clear`
    end
    check_for_username(username, pin)
end


def get_existing_user_info
    puts "What is your username?"
    username = gets.chomp.downcase.strip
    puts "What is your pin?"
    pin = gets.chomp.strip
    until pin.length == 4
        puts "Pin is not 4 digits"
        pin = gets.chomp.strip
    end
    check_user_credentials(username, pin)
end