require_relative 'player'
require 'json'

@player = nil


def json_parser
    file = File.read('database.json')
    data_hash = JSON.parse(file)
    return data_hash
end

def check_for_username(username, pin)
    data_hash = json_parser

    if data_hash['users'].any?{|hash| hash['username'] == username}        
        puts 'That name is already taken please try another name'
    else
        puts 'That name is free, entering it into the record books now'
        add_new_user(username, pin)
    end
end

def add_new_user(username, pin)
    data_hash = json_parser
    data_hash['users'].push({"username": username, "pin": pin, "p_wins": 0, "p_losses": 0, "o_wins": 0, "o_losses": 0})
    File.write('database.json', JSON.pretty_generate(data_hash))
    puts 'Username now recorded'
    @player = Player.new(username, pin.to_s, points_records = {p_wins: 0, p_losses: 0}, overall_records = {o_wins: 0, o_losses: 0} )
end

def check_user_credentials(username = nil, pin = nil)
    data_hash = json_parser
    arr = data_hash['users']
    arr.each do |user|
        if user['pin']==pin && user['username']==username
            @player = Player.new(username, pin, points_records = {p_wins: user['p_wins'].to_i, p_losses: user['p_losses'].to_i}, overall_records = {o_wins: user['o_wins'].to_i, o_losses: user['o_losses'].to_i})
            puts "Player record found welcome back #{@player.name}".colorize(:green)
            return true
        else
            next
        end
    end
    if username != nil && pin != nil 
        puts 'Incorrect username or pin'.colorize(:red)
    end
end

def end_loop(username, pin)
    data_hash = json_parser
    arr = data_hash['users']
    arr.each do |user|
        if user['pin']==pin && user['username']==username
            return true
        else
            next
        end
    false
    end
end

def update_points_records(game)
    wins = @player.points_records[:p_wins] +=  game.score[:player]
    losses = @player.points_records[:p_losses] += game.score[:computer] 
    data_hash = json_parser
    arr = data_hash['users']
    arr.each do |user|
        if user['username'] == @player.name
            user['p_wins'] = wins
            user['p_losses'] = losses
        end
    File.write('../database.json', JSON.pretty_generate(data_hash))
    end
end

def update_overall_records(game)
    file = File.read('database.json')
    data_hash = json_parser
    arr = data_hash['users']
    arr.each do |user|
        if user['username'] == @player.name
            if game.score[:player] > game.score[:computer] 
                user['o_wins'] += 1
            else 
                user['o_losses'] += 1
            end
        end
    File.write('database.json', JSON.pretty_generate(data_hash))
    end
end

