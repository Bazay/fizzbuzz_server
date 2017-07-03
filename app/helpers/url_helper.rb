module UrlHelper
  def current_url
    request.base_url + request.path
  end
end
