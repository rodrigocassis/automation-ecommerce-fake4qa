describe "ecommerce_fake4qa_case_test", :online, :smoke do
  before(:each) do
    visit("http://rodrigocassis-001-site1.atempurl.com/")
    page.current_window.resize_to(1440, 900)
    @shopping_page = ShoppingPage.new
    @cart_page = CartPage.new
    @register_page = RegisterPage.new
    @order_page = OrderPage.new
  end

  it "buy_single_products", :single => true do
    product_1 = Product.new("Skull", 5.99, 1)

    @shopping_page.add_to_cart(product_1)
    obtained_product_1 = @cart_page.get_product_cart_values(product_1)

    expect(obtained_product_1).to have_attributes(:name => product_1.name, :price => product_1.price, :quantity => product_1.quantity, :subtotal => product_1.subtotal)

    products_in_cart = [product_1]

    @cart = Cart.new(products_in_cart)

    expect("Total: $" + @cart.total.to_s).to eql @cart_page.total_text.to_s.gsub("\n", "").gsub(",", ".")
    expect("Total: " + @cart.quatity_total.to_s + " itens").to eql @cart_page.total_items_text.to_s

    @cart_page.go_registration()
    @client = Client.new("Bugiu Augusto", "bugiu@gmiau.com", "11 98746987", "Rua dos Felinos, 654", "Bloco 1", "Vila Catnip", "Araçaca", "Draken 4", "DR", "04112098")

    @register_page.fill(@client)
    @register_page.checkout

    expected_order_info = "Your Information" + @client.name + @client.phone + @client.email + "Delivery Address" + @client.address + " " + @client.comp + " - " + @client.neighborhood + " - Zip Code: " + @client.zip_code + " - " + @client.city + " - " + @client.state_cod

    expect(expected_order_info).to eql @order_page.order_your_information
    expect(products_in_cart.size).to eql @order_page.order_purchased_items_qtde

    products_in_cart.each_with_index do |element, index|
      expect(page).to have_css(".row", text: products_in_cart[index].name)
    end
  end

  it "buy_two_products", :shopping => true do
    product_1 = Product.new("Hair Dryer", 870.90, 1)
    product_2 = Product.new("Spare Tire", 1.99, 2)

    @shopping_page.add_to_cart(product_1)
    @cart_page.add_products()
    @shopping_page.add_to_cart(product_2)
    obtained_product_1 = @cart_page.get_product_cart_values(product_1)
    obtained_product_2 = @cart_page.get_product_cart_values(product_2)

    expect(obtained_product_1).to have_attributes(:name => product_1.name, :price => product_1.price, :quantity => product_1.quantity, :subtotal => product_1.subtotal)
    expect(product_2).to have_attributes(:name => obtained_product_2.name, :price => obtained_product_2.price, :quantity => obtained_product_2.quantity, :subtotal => obtained_product_2.subtotal)

    products_in_cart = [product_1, product_2]
    @cart = Cart.new(products_in_cart)

    expect("Total: $" + @cart.total.to_s).to eql @cart_page.total_text.to_s.gsub("\n", "").gsub(",", ".")
    expect("Total: " + @cart.quatity_total.to_s + " itens").to eql @cart_page.total_items_text.to_s

    @cart_page.go_registration()
    @client = Client.new("Bugiu Augusto", "bugiu@gmiau.com", "11 98746987", "Rua dos Felinos, 654", "Bloco 1", "Vila Catnip", "Araçaca", "Draken 4", "DR", "04112098")

    @register_page.fill(@client)
    @register_page.checkout

    expected_order_info = "Your Information" + @client.name + @client.phone + @client.email + "Delivery Address" + @client.address + " " + @client.comp + " - " + @client.neighborhood + " - Zip Code: " + @client.zip_code + " - " + @client.city + " - " + @client.state_cod

    expect(expected_order_info).to eql @order_page.order_your_information

    expect(products_in_cart.size).to eql @order_page.order_purchased_items_qtde

    products_in_cart.each_with_index do |element, index|
      expect(page).to have_css(".row", text: products_in_cart[index].name)
    end
  end

  it "buy_product_changing_quantity", :shopping => true do
    product_1 = Product.new("Shoes", 8.99, 3)

    @shopping_page.add_to_cart(product_1)

    obtained_product_1 = @cart_page.get_product_cart_values(product_1)

    expect(obtained_product_1).to have_attributes(:name => product_1.name, :price => product_1.price, :quantity => product_1.quantity, :subtotal => product_1.subtotal)

    products_in_cart = [product_1]
    @cart = Cart.new(products_in_cart)

    expect("Total: $" + @cart.total.to_s).to eql @cart_page.total_text.to_s.gsub("\n", "").gsub(",", ".")
    expect("Total: " + @cart.quatity_total.to_s + " itens").to eql @cart_page.total_items_text.to_s

    @cart_page.go_registration()
    @client = Client.new("Bugiu Augusto", "bugiu@gmiau.com", "11 98746987", "Rua dos Felinos, 654", "Bloco 1", "Vila Catnip", "Araçaca", "Draken 4", "DR", "04112098")

    @register_page.fill(@client)
    @register_page.checkout

    expected_order_info = "Your Information" + @client.name + @client.phone + @client.email + "Delivery Address" + @client.address + " " + @client.comp + " - " + @client.neighborhood + " - Zip Code: " + @client.zip_code + " - " + @client.city + " - " + @client.state_cod

    expect(expected_order_info).to eql @order_page.order_your_information

    expect(products_in_cart.size).to eql @order_page.order_purchased_items_qtde

    products_in_cart.each_with_index do |element, index|
      expect(page).to have_css(".row", text: products_in_cart[index].name)
    end
  end

  it "buy_product_delete_from_cart", :clean => true do
    product_1 = Product.new("Concrete Mixer", 0.78, 1)

    @shopping_page.add_to_cart(product_1)

    obtained_product_1 = @cart_page.get_product_cart_values(product_1)

    expect(obtained_product_1).to have_attributes(:name => product_1.name, :price => product_1.price, :quantity => product_1.quantity, :subtotal => product_1.subtotal)

    @cart_page.clean(product_1)
    sleep 1
    expect(page).not_to have_selector(".linha-produto")
  end
end
