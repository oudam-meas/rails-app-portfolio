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

# module PortfolioModuleViewTool
#   class Renderer
#     def self.copyright name, msg
#       "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
#     end
#   end
# end
