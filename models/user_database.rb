require_relative 'player'

@player = nil

def json_parser
    #helper function to parse json file to hash
    file = File.read('database.json')
    data_hash = JSON.parse(file)
    return data_hash
end

def check_for_username(username, pin)
    #function to check if username already taken in system
    data_hash = json_parser

    #if username taken ask user to put in another name
    if data_hash['users'].any?{|hash| hash['username'] == username}       
        puts 'That name is already taken please try another name'
    else
        #if username free add it
        puts 'That name is free, entering it into the record books now'
        add_new_user(username, pin)
    end
end

def add_new_user(username, pin)
    #adds user to the json fil and initalizes their records
    data_hash = json_parser
    data_hash['users'].push({"username": username, "pin": pin, "p_wins": 0, "p_losses": 0, "o_wins": 0, "o_losses": 0})
    File.write('database.json', JSON.pretty_generate(data_hash))
    puts 'Username now recorded'

    #initalize the player for the app session
    @player = Player.new(username, pin.to_s, points_records = {p_wins: 0, p_losses: 0}, overall_records = {o_wins: 0, o_losses: 0} )
end

def check_user_credentials(username = nil, pin = nil)
    #check to see if username and pin are correct for returning users
    data_hash = json_parser
    arr = data_hash['users']
    arr.each do |user|
        if user['pin']==pin && user['username']==username
            @player = Player.new(username, pin, points_records = {p_wins: user['p_wins'].to_i, p_losses: user['p_losses'].to_i}, overall_records = {o_wins: user['o_wins'].to_i, o_losses: user['o_losses'].to_i})
            puts "Player record found welcome back #{@player.name}".colorize(:green)
            return true
        else
            raise 'RecordNotFound' unless true
        end
    end
    #condition to handle if argv 0 and 1 are empty
    if username != nil && pin != nil 
        puts 'Incorrect username or pin'.colorize(:red)
    end
end

def end_loop(username, pin)
    #function ends the login loop doing on file verification
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

#this is part of the leaderboard feature 
def update_points_records(game)
    #updates the data in the json file to reflect the results of each round
    data_hash = json_parser
    arr = data_hash['users']
    arr.each do |user|
        #if player username matches the player
        if user['username'] == @player.name
            #change their round scores
            user['p_wins'] = @player.points_records[:p_wins] +=  game.score[:player]
            user['p_losses'] = @player.points_records[:p_losses] += game.score[:computer]
        end
    #write the new results to the json
    File.write('database.json', JSON.pretty_generate(data_hash))
    end
end

def update_overall_records(game)
    #updates the data in the json file to reflect the results of each game
    file = File.read('database.json')
    data_hash = json_parser
    arr = data_hash['users']
    arr.each do |user|
        #if player username matches the player
        if user['username'] == @player.name
             #change their game score if win
            if game.score[:player] > game.score[:computer] 
                user['o_wins'] += 1
            else 
                #change their game score if lose
                user['o_losses'] += 1
            end
        end
    #write the new results to the json
    File.write('database.json', JSON.pretty_generate(data_hash))
    end
end

