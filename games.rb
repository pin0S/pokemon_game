# require_relative 'dispatch'
require_relative 'menu'

welcome

begin
    menu
    cmd = gets.chomp.downcase.strip
end until cmd == 'q'