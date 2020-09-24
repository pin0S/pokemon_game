require 'csv'
require_relative 'player'

puts "What is your username?"
username = gets.chomp.downcase.strip
puts "What is your pin?"
pin = gets.chomp.to_i

def check_for_username(username, pin)
    table = CSV.parse(File.read('database.csv'), headers: true) 
    
    if table.by_col[0].include?(username)
        puts 'That name is already taken please try another name'
    else
        add_new_user(username, pin)
    end
end

def check_user_credentials(username = nil, pin: nil)
    rows = CSV.foreach('database.csv') do |row|
        #do something
    end
end

def add_new_user(username, pin)
    CSV.open('database.csv', "a") do |csv|
        csv << [username, pin, 0, 0]
        #append username, pin and score to csv
        #hold here
    end
end
        
check_for_username(username, pin)