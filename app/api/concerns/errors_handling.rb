module ErrorsHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do
      error_response status: 404, message: { base: 'Record not found' }
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      error_response status: 422, message: e.record.errors
    end

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      # Grape 0.9 brings changed mapping to support mutual validations
      # Reverting to old one to keep API
      error_response \
        status: e.status,
        message: Hash[e.errors.map { |key, value| [(key.length == 1) ? key.first : key, value] }]
    end
  end
end
