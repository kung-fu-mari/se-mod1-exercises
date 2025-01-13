class Wizard
    attr_reader :name
    def initialize(name, appearance={bearded: true})
        @name = name  
        @bearded = appearance[:bearded]
        @spells = 0
    end
    def bearded?
        @bearded
    end
    def incantation (text)
        'sudo ' + text
    end
    def rested?
        @spells < 3
    end
    def cast
        @spells += 1
        "MAGIC MISSILE!"
    end
end