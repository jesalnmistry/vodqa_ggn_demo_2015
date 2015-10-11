class OrderConfirmationPage

  def order_is_confirmed?
    page.has_content?('Your order has been confirmed')
  end

  def has_delivery_details?
    page.has_content?('Delivery Details:')
  end

end