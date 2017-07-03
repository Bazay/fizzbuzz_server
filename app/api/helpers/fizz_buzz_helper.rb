module FizzBuzzHelper
  extend Grape::API::Helpers

  params :fizz_buzz_params do
    requires :fizz_buzz, type: Hash do
      requires :number, type: Integer
      requires :favourite, type: Boolean
    end
  end
end
