class FizzBuzz < ApplicationRecord
  validates :number, presence: true, uniqueness: true

  class << self
    def find_or_initialize_numbers numbers
      numbers.map { |number| where(number: numbers).find_or_create_by number: number }
    end
  end

  def classification
    case
    when (number % fizzbuzz).zero? then I18n.t('fizzbuzz_caps')
    when (number % fizz).zero? then I18n.t('fizz_caps')
    when (number % buzz).zero? then I18n.t('buzz_caps')
    end
  end

  private

    def fizzbuzz
      fizz * buzz
    end

    def fizz
      configatron.fizz
    end

    def buzz
      configatron.buzz
    end
end
