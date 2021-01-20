require_relative "shopping"
require_relative "cart"
require_relative "product"

describe "ecommerce_fake4qa_case_test", :online, :smoke do
  before(:each) do
    visit("http://rodrigocassis-001-site1.atempurl.com/")
    page.current_window.resize_to(1440, 900)
    @shopping_Page = ShoppingPage.new
    @cart_Page = CartPage.new
  end

  it "buy_single_product" do
    product_1 = Product.new("Hair Dryer", 8.99)
    product_2 = Product.new("Spare Tire", 1.99)

    @shopping_Page.add_to_cart(product_1)
    @cart_Page.add_products()
    @shopping_Page.add_to_cart(product_2)

    @cart_Page.check_individual_values(product_1)

    @cart_Page.check_individual_values(product_2)

    sleep 10

    #  imagem_produto = find(".panel-body")
    #  expect(imagem_produto).to have_content "Coffee Machine"
    #  expect(imagem_produto).to have_content "$ 0.80"

    #linha_total = find(".panel-footer")
    #expect(linha_total).to have_content "Total: 1 itens"
    #expect(linha_total).to have_content "Total: $"
    #expect(linha_total).to have_content "0.80"

    #registration_button = find('a[href="/Pedido/cadastro"]')

    #puts "button text: " + registration_button.text
    #registration_button.click
    #sleep 10

    #fill_in "name", with: "Bugiu Augusto"
    #fill_in "email", with: "bugiu@gmiau.com"
    #fill_in "phone", with: "11 98746987"
    #fill_in "address", with: "Rua das Sombras, 654"
    #fill_in "comp", with: "Bloco 1"
    #fill_in "neighborhood", with: "Vila Aruça"
    #fill_in "city", with: "Araçaca"
    #drop = find("#UF")
    #drop.find("option", text: "Draken 4").select_option
    #fill_in "zupcode", with: "04112098"

    #click_button "Checkout"

    #expect(page).to have_content "bugiu@gmiau.com"
    #expect(page).to have_content "Bugiu Augusto"
    #expect(page).to have_content "Coffee Machine"
  end
end
