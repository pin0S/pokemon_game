require_relative 'dispatch'
require_relative 'views/menu'
require_relative 'views/rules'
require_relative 'models/user_database'

require 'io/console'
require 'colorize'
require 'ruby2d'
require 'json'

#user authenticated loop
puts `clear`

begin
    puts 'Is this your first time playing Pokemon Rumble? (Y/N)'.colorize(:green)
    puts 
    answer = gets.chomp.downcase.strip
    if answer == 'y'
        # new_user ideally use this after chat with teacher
        puts
        puts "Please pick a username?".colorize(:green)
        username = gets.chomp.downcase.strip
        puts "Please pick a 4 digit pin? (make sure you remember it!)".colorize(:green)
        pin = gets.chomp.strip
        unless pin.length == 4
            puts "Pin is not 4 digits...re-enter: ".colorize(:green)
            pin = gets.chomp.strip
            puts `clear`
        end
    check_for_username(username, pin)
    elsif answer == 'n'
       # get_existing_user_info ideally use this after chat with teacher
        puts "What is your username?".colorize(:green)
        username = gets.chomp.downcase.strip
        puts "What is your pin?".colorize(:green)
        pin = gets.chomp.strip
        until pin.length == 4
            puts "Pin is not 4 digits".colorize(:green)
            pin = gets.chomp.strip
        end
        check_user_credentials(username, pin)
    else
        'NOT A VALID INPUT...Please enter (Y/N)'.colorize(:red)
    end
end until end_loop(username, pin) == true

#print welcome to screen
screen_change
welcome_beats = Music.new('sounds/welcome.mp3')
welcome_beats.play
puts `clear`
welcome
welcome_beats.stop


begin
    menu
    cmd = gets.chomp.downcase.strip
    dispatch(cmd)
end until cmd == 'q' 

