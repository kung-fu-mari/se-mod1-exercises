require 'csv'

CSV.foreach('./data/animal_lovers.csv') do |row|
  require 'pry'; binding.pry
end
