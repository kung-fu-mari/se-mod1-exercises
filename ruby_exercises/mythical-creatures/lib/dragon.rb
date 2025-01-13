class Dragon
    attr_reader :name
    attr_reader :color
    attr_reader :rider
    def initialize(name, color, rider)
        @name = name
        @color = color
        @rider = rider
        @hungry = true
        @meals = 0
    end

    def hungry?
        @hungry
    end

    def eat
        @meals += 1
        if @meals >= 3
            @hungry = false
        end
    end
end