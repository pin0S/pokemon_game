
class Player

    attr_reader :name 
    attr_accessor :records
    
    def initialize(name, pin, records = {wins: 0, losses: 0})
        @name = name
        @pin = pin
        @records = records
    end

end
