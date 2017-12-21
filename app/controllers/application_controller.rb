class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Devise User Parameter Whitelist Include
  include DeviseWhitelist
  # Set Session value
  include SetSource
  # Devise Current User
  include CurrentUserConcern
  # Set defaulf content
  include DefaultPageContent
end
