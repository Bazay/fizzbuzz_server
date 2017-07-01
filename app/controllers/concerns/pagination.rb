module Pagination
  delegate :page, :per_page, :last_page?, :total_pages, to: :pagination_values

  def pagination_threshold_values
    threshold_values = [pagination_threshold_to]
    threshold_values << pagination_threshold_from if pagination_threshold_from
    threshold_values
  end

  def pagination_threshold_to
    per_page * page
  end

  def pagination_threshold_from
    per_page * page - per_page + 1 unless page == 1
  end

  def page
    pagination_values.page
  end

  def per_page
    pagination_values.per_page
  end

  def last_page?
    paginated_values.last_page?
  end

  def total_pages
    paginated_values.total_pages
  end

  def pagination_values
    ::PaginationValues.new request: request, page: params[:page], per_page: params[:per_page]
  end
end
