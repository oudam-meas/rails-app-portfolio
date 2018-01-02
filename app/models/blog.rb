class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body

  belongs_to :topic

  after_initialize :set_defaults

  has_many :comments, dependent: :destroy

  def set_defaults
    self.topic_id= Topic.last.id
  end

  def self.spacial_blog
    all
  end

  def self.featured_blog
    limit(3)
  end

  def self.recent
    order("created_at DESC")
  end
end
