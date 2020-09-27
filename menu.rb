# welcome screen
require 'colorize'

def welcome

    puts "
        ██████╗░░█████╗░██╗░░██╗███████╗███╗░░░███╗░█████╗░███╗░░██╗  ██████╗░░█████╗░██╗░░░██╗░█████╗░██╗░░░░░
        ██╔══██╗██╔══██╗██║░██╔╝██╔════╝████╗░████║██╔══██╗████╗░██║  ██╔══██╗██╔══██╗╚██╗░██╔╝██╔══██╗██║░░░░░
        ██████╔╝██║░░██║█████═╝░█████╗░░██╔████╔██║██║░░██║██╔██╗██║  ██████╔╝██║░░██║░╚████╔╝░███████║██║░░░░░
        ██╔═══╝░██║░░██║██╔═██╗░██╔══╝░░██║╚██╔╝██║██║░░██║██║╚████║  ██╔══██╗██║░░██║░░╚██╔╝░░██╔══██║██║░░░░░
        ██║░░░░░╚█████╔╝██║░╚██╗███████╗██║░╚═╝░██║╚█████╔╝██║░╚███║  ██║░░██║╚█████╔╝░░░██║░░░██║░░██║███████╗
        ╚═╝░░░░░░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝░╚════╝░╚═╝░░╚══╝  ╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝

                                ██████╗░██╗░░░██╗███╗░░░███╗██████╗░██╗░░░░░███████╗
                                ██╔══██╗██║░░░██║████╗░████║██╔══██╗██║░░░░░██╔════╝
                                ██████╔╝██║░░░██║██╔████╔██║██████╦╝██║░░░░░█████╗░░
                                ██╔══██╗██║░░░██║██║╚██╔╝██║██╔══██╗██║░░░░░██╔══╝░░
                                ██║░░██║╚██████╔╝██║░╚═╝░██║██████╦╝███████╗███████╗
                                ╚═╝░░╚═╝░╚═════╝░╚═╝░░░░░╚═╝╚═════╝░╚══════╝╚══════╝\n".colorize(:blue)
                                
    puts                            
    puts "      
                WELCOME TRAINER TO THE WONDERFUL WORLD OF POKEMON. I'M PROFESSOR OAK, YOUR GUIDE TO 
                THIS WORLD. 

                THIS IS A GAME OF FIRE WATER AND GRASS. IN YOUR WORLD YOU MIGHT CALL IT ROCK, PAPER, 
                SCISSORS. ARE YOU READY TO RUMBLE ON YOUR JOURNEY TO BECOME A POKEMON MASTER?
                                ".colorize(:green)
    puts
    puts
    puts

end
#menu display

def menu 
    print  "What would you like to do Trainer? "
    puts 'options:' 
    puts '1. Play best of 1 - (1)'
    puts '2. Play best of 3 - (3)'
    puts '3. Play best of best of 5 - (5)' 
    puts '4. See all time leader board - (b)' 
    puts '5. See your scores and stats (s)' 
    puts '6. Quit (q)'
end

