require 'csv'

require_relative 'player'

@player = nil

def csv_reader
    table = CSV.parse(File.read('database.csv'), headers: true) 
end

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
        if rows['pin'].include?(pin) && rows['username'].include?(username)
        @player = Player.new(username, pin, records = {wins: rows['wins'].to_i, losses: rows['losses'].to_i})
        return true
        else
            next
        end
    end
    puts 'Incorrect username or pin'
end

def add_new_user(username, pin)
    CSV.open('database.csv', "a") do |csv|
        csv << [username, pin, 0, 0]
    end
    puts 'Username now recorded'
    @player = Player.new(username, pin, 0, 0)
end

def end_loop(username, pin)
    table = CSV.parse(File.read('database.csv'), headers: true) 
    for rows in table
        if rows['pin'].include?(pin) && rows['username'].include?(username)
            return true
        else
            next
        end
    false
    end
end

def update_records(game)
    wins = @player.records[:wins] +=  game.score[:player]
    losses = @player.records[:losses] += game.score[:computer] 
    CSV.open('database.csv', "a+") do |csv|
        csv.each do |row|
            if row[0] == @player.name
                row[2] = wins.to_i
                row[3] = losses.to_i
            end
        end
    end
end
