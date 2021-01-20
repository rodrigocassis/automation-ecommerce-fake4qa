require_relative "product"

class CartPage
  include Capybara::DSL

  def product_name(product)
    product_row = find(".linha-produto", text: product).find("div").find.div
  end

  def check_individual_values(product)
    puts "checking values for product " + product.get_name.to_s

    linha_produto = find(".linha-produto", text: product.get_name.to_s)
    algo = linha_produto.all

    puts algo[1].text

    #puts linha_produto.text
    #product_row = find("linha-produto", text: "Frete e Total:")
    #puts product_row.text
  end

  def add_products()
    puts "adding more products"
    add_products = find('a[href="/')
    puts "button label found: " + add_products.text
    sleep 1
    add_products.click
  end
end
