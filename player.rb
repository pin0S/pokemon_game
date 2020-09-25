
class Player

    attr_reader :name 
    attr_accessor :points_records, :overall_records
    
    def initialize(name, pin, points_records = {p_wins: 0, p_losses: 0}, overall_records = {o_wins: 0, o_losses: 0})
        @name = name
        @pin = pin
        @points_records = points_records
        @overall_records = overall_records
    end

end


