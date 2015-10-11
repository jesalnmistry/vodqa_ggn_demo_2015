require 'capybara'
require 'capybara/cucumber'
require 'capybara-screenshot'
require 'capybara-screenshot/cucumber'

Capybara.default_driver = :selenium
Capybara.app_host = 'http://www.amazon.in'
Capybara.save_and_open_page_path = 'tmp/capybara'