require_relative 'dispatch'
require_relative 'menu'

welcome

cmd = nil

begin
    menu
    cmd = gets.chomp.downcase.strip
    dispatch(cmd)
end until cmd == 'q' 