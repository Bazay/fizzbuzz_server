class Api::V10::FizzBuzz < Grape::API
  helpers GrapePaginationHelper

  helpers do
    def collection
      @collection ||= ::FizzBuzzQuery.new(pagination_threshold_values).results
    end
  end

  namespace :fizz_buzz do
    desc 'List Fizz Buzzes', is_array: true
    params do
      use :pagination_params
    end
    get '/' do
      present_pagination
      present collection
    end
  end
end
