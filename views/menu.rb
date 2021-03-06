def formatter
    puts "\nPRESS ANY KEY TO RETURN TO MENU".colorize(:green)
    STDIN.getch  #waits for user input any key
end

def welcome
    #welcome screen output
    
    puts "
██████╗░░█████╗░██╗░░██╗███████╗███╗░░░███╗░█████╗░███╗░░██╗  
██╔══██╗██╔══██╗██║░██╔╝██╔════╝████╗░████║██╔══██╗████╗░██║  
██████╔╝██║░░██║█████═╝░█████╗░░██╔████╔██║██║░░██║██╔██╗██║  
██╔═══╝░██║░░██║██╔═██╗░██╔══╝░░██║╚██╔╝██║██║░░██║██║╚████║  
██║░░░░░╚█████╔╝██║░╚██╗███████╗██║░╚═╝░██║╚█████╔╝██║░╚███║  
╚═╝░░░░░░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝░╚════╝░╚═╝░░╚══╝".colorize(:blue)

    puts "
██████╗░░█████╗░██╗░░░██╗░█████╗░██╗░░░░░
██╔══██╗██╔══██╗╚██╗░██╔╝██╔══██╗██║░░░░░
██████╔╝██║░░██║░╚████╔╝░███████║██║░░░░░
██╔══██╗██║░░██║░░╚██╔╝░░██╔══██║██║░░░░░
██║░░██║╚█████╔╝░░░██║░░░██║░░██║███████╗
╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝".colorize(:blue)

    puts "
██████╗░██╗░░░██╗███╗░░░███╗██████╗░██╗░░░░░███████╗
██╔══██╗██║░░░██║████╗░████║██╔══██╗██║░░░░░██╔════╝
██████╔╝██║░░░██║██╔████╔██║██████╦╝██║░░░░░█████╗░░
██╔══██╗██║░░░██║██║╚██╔╝██║██╔══██╗██║░░░░░██╔══╝░░
██║░░██║╚██████╔╝██║░╚═╝░██║██████╦╝███████╗███████╗
╚═╝░░╚═╝░╚═════╝░╚═╝░░░░░╚═╝╚═════╝░╚══════╝╚══════╝".colorize(:blue)
                                
    puts "      
WELCOME TRAINER TO THE WONDERFUL WORLD OF POKEMON. I'M PROFESSOR OAK, YOUR GUIDE TO 
THIS WORLD.".colorize(:green)

    puts "
THIS IS A GAME OF FIRE, WATER AND GRASS. IN YOUR WORLD YOU MIGHT CALL IT ROCK, PAPER, 
SCISSORS. ARE YOU READY TO RUMBLE ON YOUR JOURNEY TO BECOME A POKEMON MASTER?".colorize(:green)

    puts "
PRESS ANY KEY TO CONTINUE".colorize(:green)

    STDIN.getch  #Waits for user input (Any Key)
    puts `clear` # Clears screen after
end

#menu display (This is part of the menu feature - other part is in dispatch loop)

def menu 
    puts `clear`
    puts "
███╗   ███╗███████╗███╗   ██╗██╗   ██╗
████╗ ████║██╔════╝████╗  ██║██║   ██║
██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝                                 
".colorize(:blue)
    puts '
What would you like to do Trainer? 
options:
1. See the game rules - (r)
2. Play best of 1 - (1)
3. Play best of 3 - (3)
4. Play best of best of 5 - (5)
5. See all time leader board - (b)
6. See your scores and stats (s)
7. Quit (q)'.colorize(:green)
end

def screen_change
    pastel = Pastel.new
    green  = pastel.on_green(" ")
    bar = TTY::ProgressBar.new("loading |:bar|",
        total: 50,
        incomplete: green
    )
    50.times do
    sleep(0.02)
    bar.advance
    end
end


