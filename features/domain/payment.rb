class Payment

  def select_payment_method
    current_page_model.choose_payment_method('Visa Debit Card')
  end

end