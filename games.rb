require_relative 'dispatch'
require_relative 'menu'
require_relative 'user_database'
require_relative 'rules'

require 'io/console'
require 'ruby2d'


#user authenticated loop


begin
    puts `clear`
    puts 'Is this your first time Playing Pokemon Rumble? (y/n)'
    puts 
    answer = gets.chomp.downcase.strip
    if answer == 'y'
        puts
        puts "What is your username?"
        username = gets.chomp.downcase.strip
        puts "What is your 4 digit pin?"
        pin = gets.chomp.strip
        puts `clear`
        unless pin.length == 4
            puts "Pin is not 4 digits...re-enter: "
            pin = gets.chomp.strip
            puts `clear`
        end
        check_for_username(username, pin)
    else 
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
end until end_loop(username, pin) == true

#print welcome to screen
puts `clear`
welcome

begin
    menu
    cmd = gets.chomp.downcase.strip
    dispatch(cmd)
end until cmd == 'q' 

