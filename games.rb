require_relative 'dispatch'
require_relative 'menu'
require_relative 'user_database'

#user authenticated loop

# def get_credientials
#     puts "What is your username?"
#     username = gets.chomp.downcase.strip
#     puts "What is your pin?"
#     pin = gets.chomp
#     check_for_username(username, pin)
# end

# def authenticate_user
#     puts "What is your username?"
#     username = gets.chomp.downcase.strip
#     puts "What is your pin?"
#     pin = gets.chomp
#     check_user_credentials(username, pin)
# end

# begin
#     puts
#     puts 'Is this your first time Playing Pokemon Rumble? (y/n)'
#     puts 
#     answer = gets.chomp.downcase.strip
#     answer == 'y' ? get_credientials : authenticate_user
# end 

welcome

begin
    menu
    cmd = gets.chomp.downcase.strip
    dispatch(cmd)
end until cmd == 'q' 