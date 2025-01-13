class Medusa
    attr_reader :name
    attr_reader :statues
    def initialize(name)
        @name = name
        @statues = []
    end
    def stare(victim)
        @statues.unshift(victim)
        if @statues.count == 4
            @statues.at(3).stoned = false
            @statues.delete_at(3)
        end
        victim.stoned = true
    end
end

class Person
    attr_reader :name
    attr_writer :stoned
    def initialize(name)
        @name = name
        @stoned = false
    end
    def stoned?
        @stoned
    end
end