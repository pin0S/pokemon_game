require_relative '../models/user_database'

#login loop to get/set usr details before entering game
def new_user
    puts
    puts "Okay then please pick a username?".colorize(:green)
    username = gets.chomp.downcase.strip
    puts "Now please pick a 4 digit pin? (make sure you remember it!)".colorize(:green)
    pin = gets.chomp.strip.to_i
    unless (pin.is_a? Integer) && (pin.to_s.length == 4)
        puts "That pin is not 4 digits and must be numbers please re-enter: ".colorize(:red)
        pin = gets.chomp.strip.to_i
        puts `clear`
    end
    check_for_username(username, pin)
    return username, pin
end

def get_existing_user_info
    puts "Welcome back, please enter your username?".colorize(:green)
    username = gets.chomp.downcase.strip
    puts "Now please enter your pin?".colorize(:green)
    pin = gets.chomp.strip.to_i
    unless (pin.is_a? Integer) && (pin.to_s.length == 4)
        puts "That pin is not 4 digits and must be numbers please re-enter: ".colorize(:red)
        pin = gets.chomp.strip.to_i
        puts `clear`
    end
    check_user_credentials(username, pin)
    return username, pin
end