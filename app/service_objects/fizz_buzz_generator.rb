class FizzBuzzGenerator
  def generate to, from = 1
    @fizzbuzzes ||= FizzBuzz.find_or_initialize_numbers([*from..to])
  end
end
