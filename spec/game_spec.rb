require_relative '../models/game'

describe 'game/new' do
    it 'should initialize new games based on number given' do
        games_3 = Game.new(3)
        expect(games_3.number_of_games).to eq(3)
    end
    it 'should return argument error' do
        game = Game.new()
        expect(game.number_of_games).to eq 0
    end
end