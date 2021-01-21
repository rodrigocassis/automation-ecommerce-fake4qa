# automation-rspec

Test automation template developed in ruby ​​using rspec, capybara and page object model
Using the fake e-commerce site developed by Automation Place
The intention is not to have a large number of test cases, because the objective of this project is to be a template to create real projects


## Setup
    Clone this project
    bundle

## Run Specs
    rspec                            # to run all specs, with default driver and env
    rspec -t my_tag:my_value         # to run specs filtered by {:my_tag=>my_value}
    rspec -t ~shopping               # to run specs without tag {:slow=>true}

### Test Cases

#### TestName
	buy_single_product

#### TestCaseDescription
	Buy a single product until order finish

#### Steps
	1 - Products Page - Choose a product get price and click in button "Add to Cart" of de product
	2 - My Cart Page - Check values (product name, price, quantity, subtotal and total)
	3 - My Cart Page - Click on "Registration"
	4 - Register Page - Fill all the fields (name, address, city, email, comp, state, phone, neighborhood and zip code)
	5 - Register Page - Click on "Checkout"
	6 - Order Summary Page - Check informations (tour information, delivery address, purchased items and quantity)


#### TestName
	buy_two_products

#### TestCaseDescription
	Buy two products until order finish

#### Steps
	1 - Products Page - Choose a product get price and click in button "Add to Cart" of de product
	2 - My Cart Page - Click on "Add Products"
	3 - Products Page - Choose a diferent product get price and click in button "Add to Cart" of de product
	4 - My Cart Page - Check values (price, qtde, subtotal and total) 
	5 - Register Page - Click on "Checkout"
	6 - My Cart Page - Click on "Registration"
	7 - Register Page - Fill all the fields (name, address, city, email, comp, state, phone, neighborhood and zip code)
	5 - Register Page - Click on "Checkout"
	6 - Order Summary Page - Check informations (tour information, delivery address, purchased items and quantity)


#### TestName
	buy_product_changing_quantity

#### TestCaseDescription
	Buy two of the same product until order finish

#### Steps
	* Products Page - Choose a product get price and click in button "Add to Cart" of de product
	* My Cart Page - Check values (price, qtde, subtotal and total)
	* My Cart Page - Click on "+" to change quantity
	* My Cart Page - Check values (price, qtde, subtotal and total)
	* My Cart Page - Click on "Registration"
	* Register Page - Fill all the fields (name, address, city, email, comp, state, phone, neighborhood and zip code)
	* Register Page - Click on "Checkout"
	* Order Summary Page - Check informations (tour information, delivery address, purchased items and quantity)


#### TestName
	buy_product_delete_from_cart

#### TestCaseDescription
	Buy a single product and delete on the cart page

#### Steps
	* Products Page - Choose a product get price and click in button "Add to Cart" of de product
	* My Cart Page - Check values (price, qtde, subtotal and total)
	* My Cart Page - Click on "-" to change quantity
	* My Cart Page - Check if the cart product has been deleted
	* My Cart Page - Check value total

