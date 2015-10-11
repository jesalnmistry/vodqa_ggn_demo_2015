class Product

  def choose_product(product_model)
    current_page_model.choose_product(product_model)
  end

  def check_product_description(product_model)
    current_page_model.check_description?(product_model)
  end

  def check_selling_price
    current_page_model.has_selling_price?('Total Cost = ')
  end

end