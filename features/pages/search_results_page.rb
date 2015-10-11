class SearchResultsPage

  def results_page_has_content?
    page.has_content?(search_query)
  end

  def choose_product(model)
    click_link(model)
  end

end