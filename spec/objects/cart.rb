class Cart
  def initialize(products)
    @total = 0

    @products_cart = products
    @quatity_total = @products_cart.size
    for product in @products_cart
      @total = @total + product.subtotal
    end
  end

  def quatity_total()
    @quatity_total
  end

  def total()
    @total
  end
end
