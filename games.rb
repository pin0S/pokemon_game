require_relative 'dispatch'
require_relative 'views/menu'
require_relative 'views/rules'
require_relative 'models/user_database'
require_relative 'controller/login_controller'

require 'io/console'
require 'colorize'
require 'ruby2d'
require 'json'

puts `clear`

#user authenticated loop
begin
    if check_user_credentials(ARGV[0], ARGV[1]) == true
        puts "Welcome back #{@player.name}"
        username, pin = ARGV[0], ARGV[1]
        ARGV.clear
    else
        puts 'Welcome to Pokemon Royal Rumble before we get going...'.colorize(:green)
        print 'Is this your first time playing Pokemon Rumble? (Y/N)'.colorize(:green)
        puts 
        answer = gets.chomp.downcase.strip
        if answer == 'y'
            username,pin = new_user
        elsif answer == 'n'
            username,pin = get_existing_user_info
        else
            'NOT A VALID INPUT...Please enter (Y/N)'.colorize(:red)
        end
    end
end until end_loop(username, pin) == true

#print welcome to screen
screen_change
welcome_beats = Music.new('sounds/welcome.mp3')
welcome_beats.play
puts `clear`
welcome
welcome_beats.stop

# game app loop
begin
    menu
    cmd = gets.chomp.downcase.strip 
    dispatch(cmd)
end until cmd == 'q' 

