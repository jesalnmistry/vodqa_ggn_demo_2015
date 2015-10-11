Given(/^I am on the amazon.in home page$/) do
  current_page_model.visit_home_page
end

And(/^I type "([^"]*)" in the search box$/) do |search_query|
  current_page_model.search(search_query)
end

When(/^I click search$/) do
  current_page_model.click_search
end

Then(/^I should see results for "([^"]*)"$/) do |search_query|
  current_page_model.results_page_has_content?(search_query)
end

When(/^I choose the "([^"]*)" model from the search$/) do |model|
  current_page_model.choose_product(model)
end

Then(/^I should see the description for my selection$/) do
  current_page_model.check_description?(@model)
end

And(/^I should also see the selling price$/) do
  current_page_model.has_selling_price?('Total Cost = ')
end

When(/^I click on add to cart button$/) do
  current_page_model.add_to_cart
end

Then(/^my cart should be updated with the "([^"]*)" headphones$/) do |arg|
  items_in_cart = current_page_model.total_items_in_cart
  items_in_cart.equal?(1)
end

When(/^I click on "([^"]*)" link$/) do |link_to_click|
  current_page_model.click_link(link_to_click)
end

And(/^I select a delivery address$/) do
  current_page_model.choose_delivery_address('Default Address')
end

And(/^I select a payment method$/) do
  current_page_model.choose_payment_method('Visa Debit Card')
end

Then(/^I should see the summary of my order$/) do
  current_page_model.should_be_page?('Order Summary')
end

When(/^I confirm the order$/) do
  current_page_model.confirm_order
end

Then(/^I should see a confirmation page$/) do
  current_page_model.order_is_confirmed?
end

And(/^I should see the delivery details$/) do
  current_page_model.has_delivery_details?
end