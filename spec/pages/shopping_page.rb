class ShoppingPage
  include Capybara::DSL

  def add_to_cart(product)
    @cart_Page = CartPage.new

    name = product.name
    product_infos = find(".produto-footer", text: name.to_s)
    product_name = product_infos.find(".produto-nome")
    add_to_cart = product_infos.find(".text-center")
    sleep 1
    add_to_cart.click

    if product.quantity > 1
      click_add = product.quantity - 1
      click_add.times do
        @cart_Page.add(product)
      end
    end
  end
end
