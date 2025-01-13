require './lib/customer'
require './lib/pet'

RSpec.describe Customer do
    it 'has attributes' do
        joel = Customer.new("Joel", 2)
        expect(joel.name).to eq("Joel")
        expect(joel.id).to eq(2)
    end

    it 'can adopt pets' do
        joel = Customer.new("Joel", 2)
        expect(joel.pets).to eq([])

        samson = Pet.new({name: "Samson", type: :dog, age: 3})
        lucy = Pet.new({name: "Lucy", type: :cat, age: 12}) 

        joel.adopt(samson)
        joel.adopt(lucy)
        expect(joel.pets).to eq([samson, lucy])
    end

    it 'can accrue debt' do
        joel = Customer.new("Joel", 2)
        expect(joel.outstanding_balance).to eq(0)

        joel.charge(15)
        joel.charge(7)
        expect(joel.outstanding_balance).to eq(22)
    end
end