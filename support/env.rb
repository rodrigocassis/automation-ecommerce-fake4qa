require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 20
  config.app_host = "http://localhost:3000"
end
