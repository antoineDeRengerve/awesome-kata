# The Price class defines methods for performing arithmetic operations on prices.
class Price
  def initialize(price)
    @price = price
  end

  def to_s
    @price.to_s
  end

  def ==(other)
    @price == other.instance_variable_get(:@price)
  end

  def +(other)
    Price.new(@price + other.instance_variable_get(:@price))
  end

  def -(other)
    Price.new(@price - other.instance_variable_get(:@price))
  end

  def *(other)
    Price.new(@price * other)
  end

  def /(other)
    Price.new(@price / other)
  end
end
