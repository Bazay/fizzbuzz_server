module ApplicationHelper
  def home_page?
    controller_name == 'home' && action_name == 'index'
  end

  def about_page?
    controller_name == 'home' && action_name == 'about'
  end
end
