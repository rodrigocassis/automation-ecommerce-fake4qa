require "capybara"
require "capybara/rspec"
require "selenium-webdriver"
require_relative "objects/product"
require_relative "objects/cart"
require_relative "objects/client"
require_relative "pages/shopping_page"
require_relative "pages/cart_page"
require_relative "pages/register_page"
require_relative "pages/oder_page"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include Capybara::DSL

  config.before (:example) do
    page.current_window.resize_to(1920, 1080)
  end

  config.after(:example) do |e|
    nome = e.description.gsub(/[^a-zA-Z]/, "").tr(" ", "_")
    page.save_screenshot("log/" + nome + ".png") #if e.exception
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 30
end
