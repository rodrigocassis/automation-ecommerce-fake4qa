class OrderPage
  include Capybara::DSL

  def order_your_information()
    panel = find(".panel-body")
    lines = panel.all(".row")

    return lines[1].text.gsub("\n", "")
  end

  def order_purchased_items_qtde()
    panel = find(".panel-body")
    lines = panel.all(".row")
    items_qtde = lines.size - 3 #3 lines of information

    return items_qtde
  end

  def order_purchased_items()
    panel = find(".panel-body")
    lines = panel.all(".row")

    products_in_page = []

    for i in 0..order_purchased_items_qtde
      products_in_page << lines[3 + i]
    end

    return products_in_page
  end

  def products_in_cart()
    find(".row", text: "Skull")

    if page.find(".row", text: "Sll")
      return find(".row", text: "Sl").text
    else
      return ""
    end
  end
end
