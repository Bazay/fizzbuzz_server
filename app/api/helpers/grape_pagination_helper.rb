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

  def pagination_threshold_values
    threshold_values = [pagination_threshold_to]
    threshold_values << pagination_threshold_from if pagination_threshold_from
    threshold_values
  end

  def pagination_threshold_to
    per_page * page
  end

  def pagination_threshold_from
    to + 1 unless page == 1
  end

  def present_pagination paginated_collection
    present :last_page, paginated_collection.last_page?
    present :total_count, paginated_collection.total_entries
  end
end
