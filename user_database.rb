require 'csv'
require_relative 'player'

# puts "What is your username?"
# username = gets.chomp.downcase.strip
# puts "What is your pin?"
# pin = gets.chomp.to_i

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
        if rows['username'] == username
            puts 'username found'
        else
            puts 'username not found'
            break
        end
        if rows['pin'] == pin && rows['username'] == username
            puts 'correct pin'
            break
        else
            puts 'incorrect pin, try again'
            break
        end
    end
end

def add_new_user(username, pin)
    CSV.open('database.csv', "a") do |csv|
        csv << [username, pin, 0, 0]
        #append username, pin and score to csv
        #hold here
    end
end
