class HomePage

  def visit_home_page
    visit('/')
  end

  def search(search_query)
    fill_in('q', :with => search_query)
  end

  def click_search
    click_button('Search')
  end

end