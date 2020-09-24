# welcome screen

puts
puts "Welcome to Pokemon Rumble, a game of fire, water, grass"
puts 5.times{print"---------"}
#menu display

begin
    print  "What would you like to do Trainer? - options {best of 3 (3) | best of 5 (5) | see leader board (b) | see your scores and stats (s) | quit (q)"
    input = gets.chomp.downcase.strip
    cmd = input
end until 'q' == cmd


#rules

# puts "The rules are as follows"
# puts "1. Pick your starter"
# puts "2. Fire beats grass, grass beats water, water beats fire"
# puts



