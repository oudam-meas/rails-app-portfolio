class Portfolio < ApplicationRecord
  validates_presence_of :title, :subtitle, :body

  # Custome Scope
  def self.angular
    where(subtitle: 'Angular')
  end

  scope :ruby_on_rails_portfolio, -> { where(subtitle: 'Ruby on Rails')}

  after_initialize :set_defaults # after initialize is call when "new" action is called in the controller

  def set_defaults
    self.main_image ||='http://via.placeholder.com/600x400'
    self.thumb_image ||='http://via.placeholder.com/350x200'
  end
  # ||=  means if main_image == nil
  #   main_image = "http://via.placeholder.com/600x400"
  
end
