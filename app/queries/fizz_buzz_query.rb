class FizzBuzzQuery < Struct.new(:pagination_threshold_values)
  def results
    FizzBuzzGenerator.new.generate *pagination_threshold_values
  end
end
