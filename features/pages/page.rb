class Page

  def click_link(link_to_click)
    click(link_to_click)
  end

  def should_be_page?(page)
    has_content?(page)
  end
end