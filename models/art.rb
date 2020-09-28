require 'pastel'
require 'ruby2d'

def bulbasaur_art
    pastel = Pastel.new(eachline: "\n")
    pastel.alias_color(:funky, :green, :bold)
    sleep(1)
    cry = Sound.new('sounds/cry.wav')
    cry.play
    File.open("art/bulbasaur.txt").each do |line|
        puts pastel.funky(line)
    end
    
end

def squirtle_art
    pastel = Pastel.new(eachline: "\n")
    pastel.alias_color(:funky, :blue, :bold)
    sleep(1)
    cry = Sound.new('sounds/cry2.wav')
    cry.play
    File.open("art/squirtle.txt").each do |line|
        puts pastel.funky(line)
    end
    
end

def charmander_art
    pastel = Pastel.new(eachline: "\n")
    pastel.alias_color(:funky, :red, :bold)
    sleep(1)
    cry = Sound.new('sounds/cry3.wav')
    cry.play
    File.open("art/charmander.txt").each do |line|
        puts pastel.funky(line)
    end
    
end