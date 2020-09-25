require 'json'

require_relative 'player'

@player = nil

def check_for_username(username, pin)
    file = File.read('database.json')
    data_hash = JSON.parse(file)

    if data_hash['users'].any?{|hash| hash['username'] == username}        
        puts 'That name is already taken please try another name'
    else
        puts 'That name is free, entering it into the record books now'
        add_new_user(username, pin)
    end
end

def add_new_user(username, pin)
    file = File.read('database.json')
    data_hash = JSON.parse(file)
    data_hash['users'].push({"username": username, "pin": pin, "wins": 0, "losses": 0})
    File.write('database.json', JSON.pretty_generate(data_hash))
    puts 'Username now recorded'
    @player = Player.new(username, pin, records = {wins: 0, losses: 0})
end

def check_user_credentials(username = nil, pin = nil)
    file = File.read('database.json')
    data_hash = JSON.parse(file)
    arr = data_hash['users']
    arr.each do |user|
        if user['pin']==pin && user['username']==username
            @player = Player.new(username, pin, records = {wins: arr['wins'], losses: arr['losses']})
            return true
        else
            next
        end
    end
    puts 'Incorrect username or pin'
end

def end_loop(username, pin)
    file = File.read('database.json')
    data_hash = JSON.parse(file)
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



