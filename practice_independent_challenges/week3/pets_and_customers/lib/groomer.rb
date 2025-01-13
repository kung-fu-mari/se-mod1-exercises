class Groomer
    attr_reader :name,
                :customers,
                :charges
    def initialize(name)
        @name = name
        @customers = []
        @charges = []
    end

    def add_customer(customer)
        @customers.append(customer)
    end

    def find_customers_with_debt
        debters = @customers.select do |debter|
            debter.outstanding_balance > 0
        end
    end

    def count_pets(type)
        num = 0
        @customers.each do |customer|
            customer.pets.each do |pet|
                if pet.type == type
                    num += 1
                end
            end
        end
        return num
    end

    def charge_customer(customer, service, pet)
        price = 0

        case service
        when :wash
            price = 15    
        when :haircut
            price = 10
        end

        customer.charge(price)
        @charges.append([service, price, customer, pet])
    end
end