require './lib/pet.rb'
RSpec.describe Pet do

    it "has attributes" do
        samson = Pet.new({name: 
        "Samson", type: :dog, age: 3}) 

        expect(samson).to be_instance_of(Pet)
        expect(samson.name).to eq("Samson")
        expect(samson.type).to eq(:dog)
        expect(samson.age).to eq(3)   
    end

    it "eats food" do
        samson = Pet.new({name: 
        "Samson", type: :dog, age: 3}) 
        
        expect(samson.fed?).to eq(false)
        samson.feed
        expect(samson.fed?).to eq(true)
    end
end