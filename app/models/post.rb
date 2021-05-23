class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments
  validates :title, presence: true

  scope :ordered, ->(direction = :desc) { order(created_at: direction)}
end
