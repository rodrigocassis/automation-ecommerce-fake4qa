class CartPage
  include Capybara::DSL

  def product_name(product)
    product_row = find(".linha-produto", text: product).find("div").find.div
  end

  def get_product_cart_values(product)
    sleep 1

    linha_produto = find(".linha-produto", text: product.name.to_s)
    product_cart_infos = linha_produto.all("div")

    product_name = product_cart_infos[1].text
    product_price = product_cart_infos[2].text.gsub(" ", "").gsub("$", "")
    quantity_box = product_cart_infos[3].find("input")[:value]
    product_subtotal = product_cart_infos[5].text.gsub("\n", "").gsub("$", "")

    obtained_product = Product.new(product_name.to_s, product_price.to_f, quantity_box.to_i)

    return obtained_product
  end

  def add_products()
    add_products = find('a[href="/')
    sleep 1
    add_products.click
  end

  def add(product)
    sleep 1
    linha_produto = find(".linha-produto", text: product.name.to_s)
    product_cart_infos = linha_produto.all("div")
    quantity_buttons = product_cart_infos[3].all("button")

    sleep 1

    quantity_buttons[1].click
  end

  def go_registration()
    sleep 1
    registration_button = find('a[href="/Pedido/cadastro"]')
    registration_button.click
  end

  def total_items_text()
    find(".col-md-10").text
  end

  def total_text()
    find(".panel-footer").find(".col-md-2").text
  end

  def clean(product)
    sleep 1
    linha_produto = find(".linha-produto", text: product.name.to_s)
    product_cart_infos = linha_produto.all("div")
    quantity_buttons = product_cart_infos[3].all("button")
    sleep 1
    quantity_buttons[0].click
  end
end
