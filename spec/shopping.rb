require_relative "product"

class ShoppingPage
  include Capybara::DSL

  def add_to_cart(product)
    name = product.get_name
    puts "adding product to cart " + name.to_s

    product_infos = find(".produto-footer", text: name.to_s)
    product_name = product_infos.find(".produto-nome")
    add_to_cart = product_infos.find(".text-center")
    sleep 1
    add_to_cart.click

    puts "product " + name.to_s + " added to cart."
  end
end
