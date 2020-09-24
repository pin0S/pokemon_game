require_relative 'player'


class Computer < Player

    attr_reader :name

    def initialize(name: nil)
        @name = ['Gary', 'Professor Oak', 'Brock', 'Misty', 
                'Ash Ketchum', 'Lass', 'Fisherman', 'Hiker',
                'Super Nerd', 'Bug Catcher', 'Gambler'].sample(1)
    end

end
