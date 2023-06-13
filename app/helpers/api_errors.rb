require 'sinatra/extension'

module ApiErrors
  extend Sinatra::Extension

  error Validations::InvalidParams, KeyError do
    status 422
    json({ errors: I18n.t(:missing_parameters, scope: 'api.errors') })
  end
end
