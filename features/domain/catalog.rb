class Catalog

  def search_item(item)
    current_page_model.search(search_query)
    current_page_model.click_search
  end

  def search_has_results?
    current_page_model.results_page_has_content?(search_query)
  end

end