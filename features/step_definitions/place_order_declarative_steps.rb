Given(/^I search for "([^"]*)" on the home page$/) do |search_query|
  current_page_model.visit_home_page
  current_page_model.search(search_query)
  current_page_model.click_search
  current_page_model.results_page_has_content?(search_query)
end

And(/^I place an order for the "([^"]*)" model from the search results$/) do |arg|

  current_page_model.choose_product(model)

  current_page_model.check_description?(@model)

  current_page_model.has_selling_price?('Total Cost = ')

  current_page_model.add_to_cart

  items_in_cart = current_page_model.total_items_in_cart
  items_in_cart.equal?(1)

  current_page_model.click_link(link_to_click)

  current_page_model.choose_delivery_address('Default Address')

  current_page_model.choose_payment_method('Visa Debit Card')

  current_page_model.should_be_page?('Order Summary')

  current_page_model.confirm_order

end

Then(/^my order for headphones should be confirmed$/) do
  current_page_model.order_is_confirmed?
end

And(/^I should see the delivery details for my order$/) do
  current_page_model.has_delivery_details?
end