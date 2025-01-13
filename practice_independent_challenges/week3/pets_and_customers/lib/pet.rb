class Pet
    attr_reader :name,
                :type,
                :age

    def initialize(info)
        @name = info[:name]
        @type = info[:type]
        @age = info[:age]
        @fed = false
    end

    def fed?
        @fed
    end

    def feed
        @fed = true
    end
end