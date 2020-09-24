# welcome screen

def welcome
    puts
    puts "Welcome to Pokemon Rumble, a game of fire, water, grass"
    puts 5.times{print"---------"}
end

#menu display

def menu 
    print  "What would you like to do Trainer? "
    puts 'options:' 
    puts '1. Play best of 3 - (3)'
    puts '2. Play best of best of 5 - (5)' 
    puts '3. See all time leader board - (b)' 
    puts '4. See your scores and stats (s)' 
    puts '5. Quit (q)'
end