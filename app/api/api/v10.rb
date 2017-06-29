class Api::V10 < Grape::API
  version 'v1.0', cascade: true

  mount Api::V10::FizzBuzz
end
