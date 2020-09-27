require 'pastel'

def bulbasaur_art
    pastel = Pastel.new(eachline: "\n")
    pastel.alias_color(:funky, :green, :bold)
    File.open("./art/bulbasaur.txt").each do |line|
        puts pastel.on_black(line)
    end
end

def squirtle_art
    pastel = Pastel.new(eachline: "\n")
    pastel.alias_color(:funky, :blue, :bold)
    File.open("./art/squirtle.txt").each do |line|
        puts pastel.on_black(line)
    end
end

def charmander_art
    pastel = Pastel.new(eachline: "\n")
    pastel.alias_color(:funky, :red, :bold)
    File.open("./art/charmander.txt").each do |line|
        puts pastel.on_black(line)
    end
end