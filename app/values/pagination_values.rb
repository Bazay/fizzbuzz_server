class PaginationValues
  using Refinements::PositiveNumber

  attr_reader :request

  delegate :previous_page_url, :next_page_url, to: :pagination_url_builder

  def initialize request:, page: nil, per_page: nil, default_page: nil, default_per_page: nil
    @request = request
    @default_page = default_page || configatron.pagination.page
    @default_per_page = default_per_page || configatron.pagination.per_page
    @page = page.fetch_positive_number @default_page
    @per_page = per_page
  end

  def page
    @page <= total_pages ? @page : total_pages
  end

  def per_page
    @per_page.fetch_positive_number @default_per_page
  end

  def first_page?
    page <= 1
  end

  def last_page?
    page >= total_pages
  end

  def total_pages
    configatron.fizzbuzz_values.maximum / per_page
  end

  def pagination_url_builder
    ::PaginationUrlBuilder.new request, self
  end
end
