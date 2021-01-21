class RegisterPage
  include Capybara::DSL

  def fill(client)
    sleep 1

    fill_in "name", with: client.name
    fill_in "email", with: client.email
    fill_in "phone", with: client.phone
    fill_in "address", with: client.address
    fill_in "comp", with: client.comp
    fill_in "neighborhood", with: client.neighborhood
    fill_in "city", with: client.city
    drop = find("#UF")
    drop.find("option", text: client.state).select_option
    fill_in "zupcode", with: client.zip_code
  end

  def checkout
    click_button "Checkout"
  end
end
