class Customer

  def visit_home_page
    current_page_model.visit_home_page
  end

  def select_delivery_address(address)
    current_page_model.choose_delivery_address(address)
  end

end