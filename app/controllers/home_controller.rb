class HomeController < ApplicationController
  def index
    @fizzbuzz = FizzBuzzQuery.new(pagination_threshold_values).results
    @pagination_values = pagination_values
  end

  def about
  end
end
