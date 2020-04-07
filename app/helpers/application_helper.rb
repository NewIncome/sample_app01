module ApplicationHelper
  def full_title(page)
    page == 'Home' ? 'Sample-App' : "S-A | " + page
  end
end