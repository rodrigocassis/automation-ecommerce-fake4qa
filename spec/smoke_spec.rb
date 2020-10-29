describe "ecommerce_fake4qa", :online, :smoke do
  before(:each) do
    visit("http://rodrigocassis-001-site1.atempurl.com/")
  end

  it "buy_single_product" do
    find("#produto_038").click
    find(".img-produto-carrinho")

    imagem_produto = find(".panel-body")
    expect(imagem_produto).to have_content "Coffee Machine"
    expect(imagem_produto).to have_content "$ 0.80"

    linha_total = find(".panel-footer")
    expect(linha_total).to have_content "Total: 1 itens"
    expect(linha_total).to have_content "Total: $"
    expect(linha_total).to have_content "0.80"

    registration_button = find(".col-md-12")
    registration_button.find("a", text: /Registration?/i).click

    fill_in "name", with: "Bugiu Augusto"
    fill_in "email", with: "bugiu@gmiau.com"
    fill_in "phone", with: "11 98746987"
    fill_in "address", with: "Rua das Sombras, 654"
    fill_in "comp", with: "Bloco 1"
    fill_in "neighborhood", with: "Vila Aruça"
    fill_in "city", with: "Araçaca"
    drop = find("#UF")
    drop.find("option", text: "Draken 4").select_option
    fill_in "zupcode", with: "04112098"

    click_button "Checkout"

    expect(page).to have_content "bugiu@gmiau.com"
    expect(page).to have_content "Bugiu Augusto"
    expect(page).to have_content "Coffee Machine"
  end
end
