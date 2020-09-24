
class Player

    attr_reader :name, :records

    def initialize(name, pin)
        @name = name
        @pin = pin
        @records = {wins: 0, losses: 0}
    end

end

