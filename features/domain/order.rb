class Order

  def on_order_summary_page?
    current_page_model.should_be_page?('Order Summary')
  end

  def confirm_order
    current_page_model.confirm_order
  end

  def is_confirmed?
    current_page_model.order_is_confirmed?
  end

  def has_delivery_details?
    current_page_model.has_delivery_details?
  end

end