class PaginationUrlBuilder < UrlBuilder
  attr_reader :pagination_values

  def initialize request, pagination_values
    @pagination_values = pagination_values
    super request
  end

  def previous_page_url
    build_current_url_with_params page: previous_page unless pagination_values.first_page?
  end

  def next_page_url
    build_current_url_with_params page: next_page unless pagination_values.last_page?
  end

  private

    def previous_page
      pagination_values.page - 1
    end

    def next_page
      pagination_values.page + 1
    end
end
