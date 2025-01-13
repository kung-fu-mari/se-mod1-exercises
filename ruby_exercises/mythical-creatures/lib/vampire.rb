class Vampire
    attr_reader :name
    attr_reader :pet
    attr_reader :thirsty

    def initialize(name, pet = "bat")
        @name = name
        @pet = pet
        @thirsty = true
    end

    def drink
        @thirsty = false
    end
end