class UrlBuilder
  attr_reader :request

  def initialize request
    @request = request
  end

  def current_url
    request.base_url + request.path
  end

  def current_url_with_params
    request.original_url
  end 

  def build_current_url_with_params params
    current_url + to_query_string(parsed_params_hash.with_indifferent_access.merge(params))
  end

  private

    def to_query_string hash
      "?#{hash.to_query}"
    end

    def parsed_params_hash
      @parsed_params_hash ||= Rack::Utils.parse_nested_query current_query_string
    end

    def current_query_string
      URI.parse(current_url_with_params).query
    end
end
