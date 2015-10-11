
Given(/^I search for "([^"]*)" on the home page$/) do |search_query|
  Customer::visit_home_page
  Catalog::search_item(search_query)
  Catalog::search_has_results?.be_true?
end

And(/^I place an order for the "([^"]*)" model from the search results$/) do |product_model|

  Product::choose_product(product_model)

  Product::check_product_description(product_model).be_present?

  Product::check_selling_price.be_present?

  Cart::add_product_to_cart

  items_in_cart = Cart::get_total_items_in_cart
  items_in_cart.equal?(1)

  Cart::checkout_cart

  Customer::select_delivery_address('Default Address')

  Payment::select_payment_method('Visa Debit Card')

  Order::on_order_summary_page?.be_true?

  Order::confirm_order

end

Then(/^my order for headphones should be confirmed$/) do
  Order::is_confirmed?.be_true?
end

And(/^I should see the delivery details for my order$/) do
  Order::has_delivery_details?.be_true?
end