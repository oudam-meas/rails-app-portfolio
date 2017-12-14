module Placeholder
  extend ActiveSupport::Concern

  def self.image_generator(h:,w:)
    "http://via.placeholder.com/#{h}x#{w}"
  end
end