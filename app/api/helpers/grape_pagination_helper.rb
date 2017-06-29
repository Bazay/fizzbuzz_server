module GrapePaginationHelper
  extend Grape::API::Helpers

  params :pagination_params do
    optional :page, type: Integer, default: configatron.api.page
    optional :per_page, type: Integer, default: configatron.api.per_page
  end

  def page
    params[:page]
  end

  def per_page
    params[:per_page].abs
  end
end
