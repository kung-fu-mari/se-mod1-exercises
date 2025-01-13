class Paint
  attr_reader :color, :amount

  def initialize(color, amount = 0)
    sleep(5)
    @color = color
    @amount = amount
  end
end
