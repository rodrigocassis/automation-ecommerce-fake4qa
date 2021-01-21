class Product
  def initialize(prod_name, price, quantity)
    @product_name = prod_name
    @product_price = price
    @product_quantity = quantity
    @product_subtotal = price.to_f * quantity.to_i
  end

  def price()
    @product_price
  end

  def name()
    @product_name
  end

  def quantity()
    @product_quantity
  end

  def subtotal()
    @product_subtotal
  end
end
