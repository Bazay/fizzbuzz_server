class Api::V10::FizzBuzz < Grape::API
  helpers GrapePaginationHelper
  helpers FizzBuzzHelper

  helpers do
    def collection
      @collection ||= ::FizzBuzzQuery.new(pagination_threshold_values).results
    end

    def fizz_buzz
      @fizz_buzz ||= ::FizzBuzz.find_or_initialize_by(number: params[:fizz_buzz][:number])
    end
  end

  namespace :fizz_buzz do
    desc 'List Fizz Buzzes', is_array: true
    params do
      use :pagination_params
    end
    get '/' do
      present_pagination
      present :fizz_buzzes, collection, with: Entities::FizzBuzz
    end

    desc 'Create new fizz buzz'
    params do
      use :fizz_buzz_params
    end
    post '/' do
      form = ::FizzBuzzForm.new(fizz_buzz, params[:fizz_buzz])
      present :fizz_buzz, form.model, with: Entities::FizzBuzz if form.save
    end
  end
end
