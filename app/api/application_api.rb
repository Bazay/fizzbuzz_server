require 'grape-swagger'

class ApplicationAPI < Grape::API
  cascade true
  include ErrorsHandling

  format :json
  default_format :json

  formatter :json, Grape::Formatter::Rabl
  error_formatter :json, JsonApiFormatter

  helpers ResponseApiHelper

  # Mount higher version APIs at the top
  mount Api::V10

  desc 'Website and API versions'
  get :version do
    {
      website_version: `cat #{Rails.root.join('VERSION').to_s}`,
      api_version: 'v1.0'
    }
  end
end
