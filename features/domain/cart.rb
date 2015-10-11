class Cart

  def add_product_to_cart
    current_page_model.add_to_cart
  end

  def get_total_items_in_cart
    current_page_model.total_items_in_cart
  end

  def checkout_cart
    current_page_model.click_link('Proceed to checkout')
  end

end