class FizzBuzzDecorator < SimpleDelegator
  def last_page?
    # TODO
  end

  def total_entries
    configatron.api.fizzbuzz_values.maximum
  end
end
