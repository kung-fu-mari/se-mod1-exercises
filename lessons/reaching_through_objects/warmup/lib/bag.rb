class Bag
  attr_reader :candies

  def initialize
    @candies = []
  end
  def count
    @candies.count
  end
  def empty?
    @candies.count <= 0
  end
  def add_candy(candy)
    @candies.append candy
  end
  def contains?(candy_type)
    in_bag = @candies.any? do |candy|
      candy.type == candy_type
    end
    return in_bag
  end 
end
