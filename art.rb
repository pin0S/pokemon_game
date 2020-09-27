require 'pastel'

def baulbasaur
    pastel = Pastel.new(eachline: "\n")
    pastel.alias_color(:funky, :green, :bold)
    File.readlines("./art/bulbasaur.txt") do |line|
        puts pastel.on_black(line)
    end
end

def squirtle
    pastel = Pastel.new(eachline: "\n")
    pastel.alias_color(:funky, :blue, :bold)
    File.readlines("./art/squirtle.txt") do |line|
        puts pastel.on_black(line)
    end
end

def charmander
    pastel = Pastel.new(eachline: "\n")
    pastel.alias_color(:funky, :red, :bold)
    File.readlines("./art/charmander.txt") do |line|
        puts pastel.on_black(line)
    end
end



