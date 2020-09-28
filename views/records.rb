require 'text-table'
require 'json'

def get_leaderboard
    file = File.read('./database.json')
    data_hash = JSON.parse(file)
    arr = data_hash['users']
    top_3 = arr.group_by { |r| r["o_wins"] }
      .sort_by  { |k, v| -k }
      .first(3)
      .map(&:last)
      .flatten
    puts 
    table = Text::Table.new(:head => ['Trainer', 'Score'], :rows => [[top_3[0]['username'], top_3[0]['o_wins']], [top_3[1]['username'], top_3[1]['o_wins']], [top_3[2]['username'], top_3[2]['o_wins']]])
    puts table.to_s
end

def get_user_stats
    file = File.read('./database.json')
    data_hash = JSON.parse(file)
    arr = data_hash['users']
    arr.each do |user|
        if user['username'] == @player.name
            table = Text::Table.new(:head => ['Trainer', 'Round Wins/Losses', 'Game Wins/Losses'], :rows => [[user['username'], "#{user['p_wins']}/#{user['p_losses']}", "#{user['o_wins']}/#{user['o_losses']}"]])
            puts table
        end
    end
end