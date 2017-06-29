class FizzBuzzGenerator
  def generate to, from = 1
    (from..to).map { |number| fizz_buzz? number }
  end

  private

    def fizz_buzz? number
      case
      when (number % fizz_buzz).zero? then 'FizzBuzz'
      when (number % fizz).zero? then 'Fizz'
      when (number % buzz).zero? then 'Buzz'
      end
    end

    def fizz_buzz
      fizz * buzz
    end

    def fizz
      configatron.fizz
    end

    def buzz
      configatron.buzz
    end
end
