Given(/^I search for "([^"]*)" on the home page$/) do |search_query|
  Customer::visit_home_page
  #current_page_model.visit_home_page

  Catalog::search_item(search_query) # Customer::search_item(search_query)
  #current_page_model.search(search_query)
  #current_page_model.click_search

  Catalog::search_has_results?.be_true?
  #current_page_model.results_page_has_content?(search_query)
end

And(/^I place an order for the "([^"]*)" model from the search results$/) do |product_model|

  Product::choose_product(product_model)
  #current_page_model.choose_product(model)

  Product::check_product_description(product_model).be_present?
  #current_page_model.check_description?(product_model)

  Product::check_selling_price.be_present?
  #current_page_model.has_selling_price?('Total Cost = ')

  Cart::add_product_to_cart
  #current_page_model.add_to_cart

  items_in_cart = Cart::get_total_items_in_cart
  #items_in_cart = current_page_model.total_items_in_cart
  items_in_cart.equal?(1)

  Cart::checkout_cart
  #current_page_model.click_link(link_to_click)

  Customer::select_delivery_address('Default Address')
  #current_page_model.choose_delivery_address('Default Address')

  Payment::select_payment_method('Visa Debit Card')
  #current_page_model.choose_payment_method('Visa Debit Card')

  Order::on_order_summary_page?.be_true?
  #current_page_model.should_be_page?('Order Summary')

  Order::confirm_order
  #current_page_model.confirm_order

end

Then(/^my order for headphones should be confirmed$/) do
  Order::is_confirmed?.be_true?
  #current_page_model.order_is_confirmed?
end

And(/^I should see the delivery details for my order$/) do
  Order::has_delivery_details?
  #current_page_model.has_delivery_details?
end