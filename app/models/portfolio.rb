class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }
  include Placeholder

  validates_presence_of :title, :subtitle, :body

  # Custome Scope
  def self.angular
    where(subtitle: 'Angular')
  end

  scope :ruby_on_rails_portfolio, -> { where(subtitle: 'Ruby on Rails')}

  # Default attributes value
  after_initialize :set_defaults # after initialize is call when "new" action is called in the controller

  def set_defaults
    # self.main_image ||= Placeholder.image_generator(h: '600', w: '400')
    self.thumb_image ||= Placeholder.image_generator(h: '350', w: '200')
  end
  # ||=  means if main_image == nil
  #   main_image = "http://via.placeholder.com/600x400"

end
