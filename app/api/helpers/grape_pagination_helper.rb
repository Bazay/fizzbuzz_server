module GrapePaginationHelper
  extend Grape::API::Helpers

  include Pagination

  params :pagination_params do
    optional :page, type: Integer, default: configatron.api.page
    optional :per_page, type: Integer, default: configatron.api.per_page
  end

  def present_pagination
    present :page, page
    present :last_page, last_page?
    present :total_pages, total_pages
  end
end
