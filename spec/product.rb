class Product
  def initialize(prod_name, price)
    @product_name = prod_name
    @product_price = price
  end

  def get_price()
    return @product_price
  end

  def get_name()
    return @product_name
  end
end
