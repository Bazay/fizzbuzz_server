class Api::V10::FizzBuzz < Grape::API
  helpers GrapePaginationHelper

  helpers do
  end

  namespace :fizz_buzz do
    desc 'List Fizz Buzzes', is_array: true
    params do
      use :pagination_params
    end
    get '/' do
      say_completed
    end
  end
end
