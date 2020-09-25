require_relative 'dispatch'
require_relative 'menu'
require_relative 'json_updater'

#user authenticated loop

begin
    puts
    puts 'Is this your first time Playing Pokemon Rumble? (y/n)'
    puts 
    answer = gets.chomp.downcase.strip
    if answer == 'y'
        puts "What is your username?"
        username = gets.chomp.downcase.strip
        puts "What is your pin?"
        pin = gets.chomp.strip
        check_for_username(username, pin)
    else 
        puts "What is your username?"
        username = gets.chomp.downcase.strip
        puts "What is your pin?"
        pin = gets.chomp.strip
        check_user_credentials(username, pin)
    end
end until end_loop(username, pin) == true

welcome

begin
    menu
    cmd = gets.chomp.downcase.strip
    dispatch(cmd)
end until cmd == 'q' 