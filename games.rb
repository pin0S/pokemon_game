require_relative 'dispatch'
require_relative 'menu'
require_relative 'user_database'

#user authenticated loop

begin
    puts
    puts 'Is this your first time Playing Pokemon Rumble? (y/n)'
    puts 
    answer = gets.chomp.downcase.strip
    if answer == 'y'
        puts "What is your username?"
        username = gets.chomp.downcase.strip
        puts "What is your 4 digit pin?"
        pin = gets.chomp.strip
        unless pin.length == 4
            puts "Pin is not 4 digits...re-enter: "
            pin = gets.chomp.strip
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

begin
    welcome
    any_key = gets.chomp.downcase
end until any_key.length > 0 || any_key == nil

begin
    menu
    cmd = gets.chomp.downcase.strip
    dispatch(cmd)
end until cmd == 'q' 