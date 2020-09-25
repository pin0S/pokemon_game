require 'csv'
require_relative 'player'

@player = nil

def check_for_username(username, pin)
    table = CSV.parse(File.read('database.csv'), headers: true) 
    
    if table.by_col[0].include?(username)
        puts 'That name is already taken please try another name'
    else
        puts 'That name is free, entering it into the record books now'
        add_new_user(username, pin)
    end
end

def check_user_credentials(username = nil, pin = nil)
    table = CSV.parse(File.read('database.csv'), headers: true) 
    for rows in table
        if rows['pin'] == pin && rows['username'] == username
            @player = Player.new(username, pin, records = {wins: rows['wins'], losses: rows['losses']})
            break
        elsif rows['username'] != username 
            puts 'incorrect username'
        elsif rows['pin'] != pin
            puts 'incorrect pin, try again'
        end
    end
end

def add_new_user(username, pin)
    CSV.open('database.csv', "a") do |csv|
        csv << [username, pin, 0, 0]
    end
    @player = Player.new(username, pin)
end