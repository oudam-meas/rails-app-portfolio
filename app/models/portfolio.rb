class Portfolio < ApplicationRecord
  validates_presence_of :title, :subtitle, :body

  # Custome Scope
  def self.angular
    where(subtitle: 'Angular')
  end

  scope :ruby_on_rails_portfolio, -> { where(subtitle: 'Ruby on Rails')}
end
