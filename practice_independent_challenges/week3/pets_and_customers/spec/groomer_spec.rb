require './lib/pet'
require './lib/customer'
require './lib/groomer'

RSpec.describe Groomer do
    it 'has a unique name' do
        groomer = Groomer.new('Chez Pup')
        expect(groomer.name).to eq('Chez Pup')
    end

    it 'can have customers with pets' do
        groomer = Groomer.new('Chez Pup')
        expect(groomer.customers).to eq([])

        john = Customer.new("John", 0)
        jesse= Customer.new("Jesse", 48)
        doug = Customer.new("Doug", 85)

        samson = Pet.new({name: "Samson", type: :dog, age: 3})
        lucy = Pet.new({name: "Lucy", type: :cat, age: 12}) 
        eric = Pet.new({name: "Eric", type: :fruit_bat, age: 5})
        ericc = Pet.new({name: "Ericc", type: :dog, age: 2})
        
        john.adopt(samson)
        john.adopt(lucy)
        jesse.adopt(eric)
        doug.adopt(ericc)

        groomer.add_customer(john)
        groomer.add_customer(jesse)
        groomer.add_customer(doug)

        expect(groomer.customers).to eq([john, jesse, doug])
        expect(groomer.customers[1].pets[0]).to eq(eric)
    end

    it 'can find all customers with outstanding balances' do
        groomer = Groomer.new('Chez Pup')

        john = Customer.new("John", 0)
        jesse= Customer.new("Jesse", 48)
        doug = Customer.new("Doug", 85)
        groomer.add_customer(john)
        groomer.add_customer(jesse)
        groomer.add_customer(doug)

        john.charge(28)
        jesse.charge(83)
        expect(groomer.find_customers_with_debt).to eq([john, jesse])
    end

    it 'can count pets by type' do
        groomer = Groomer.new('Chez Pup')

        john = Customer.new("John", 0)
        jesse= Customer.new("Jesse", 48)
        doug = Customer.new("Doug", 85)

        samson = Pet.new({name: "Samson", type: :dog, age: 3})
        lucy = Pet.new({name: "Lucy", type: :cat, age: 12}) 
        eric = Pet.new({name: "Eric", type: :fruit_bat, age: 5})
        ericc = Pet.new({name: "Ericc", type: :dog, age: 2})
        
        john.adopt(samson)
        john.adopt(lucy)
        jesse.adopt(eric)
        doug.adopt(ericc)

        groomer.add_customer(john)
        groomer.add_customer(jesse)
        groomer.add_customer(doug)

        expect(groomer.count_pets(:dog)).to eq(2)
        expect(groomer.count_pets(:fruit_bat)).to eq(1)
        expect(groomer.count_pets(:narwhal)).to eq(0)
    end

    it 'keeps track of customer charges' do
        groomer = Groomer.new('Chez Pup')

        john = Customer.new("John", 0)
        jesse= Customer.new("Jesse", 48)
        doug = Customer.new("Doug", 85)

        samson = Pet.new({name: "Samson", type: :dog, age: 3})
        lucy = Pet.new({name: "Lucy", type: :cat, age: 12}) 
        eric = Pet.new({name: "Eric", type: :fruit_bat, age: 5})
        ericc = Pet.new({name: "Ericc", type: :dog, age: 2})
        
        john.adopt(samson)
        john.adopt(lucy)
        jesse.adopt(eric)
        doug.adopt(ericc)

        groomer.add_customer(john)
        groomer.add_customer(jesse)
        groomer.add_customer(doug)

        groomer.charge_customer(john, :wash, john.pets[0])
        groomer.charge_customer(john, :haircut, john.pets[1])
        groomer.charge_customer(doug, :wash, doug.pets[0])

        expect(groomer.charges).to eq([[:wash, 15, john, john.pets[0]],
                                    [:haircut, 10, john, john.pets[1]],
                                    [:wash, 15, doug, doug.pets[0]]])
    end
end