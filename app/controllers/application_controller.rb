class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Devise User Parameter Whitelist Include
  include DeviseWhitelist

end
