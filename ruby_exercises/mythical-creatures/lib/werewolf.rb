class Werewolf
    attr_reader :name
    attr_reader :location
    attr_reader :victims
    def initialize(name, location="none")
        @name = name
        @location = location
        @human = true
        @hungry = false
        @victims = []
    end
    def human?
        @human
    end
    def wolf?
        @human != true
    end
    def change!
        @human = !(@human)
        @hungry = true
    end
    def hungry?
        @hungry
    end
    def consume(victim)
        if wolf?

            victim.status = :dead
            p victim.status
            @victims.push(victim)
            @hungry = false
        end
    end
end