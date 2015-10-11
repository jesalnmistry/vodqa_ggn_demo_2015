class ProductPage

  def check_desciption?(model)
    page.has_content?('Description for ' + model)
  end

  def has_selling_price?
    page.has_content?('Total Cost = ')
  end

  def add_to_cart
    click_button('Add to cart')
  end

  def total_items_in_cart
  locate('shopping_cart').value
  end
end