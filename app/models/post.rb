class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :title, presence: true

  scope :ordered, ->(direction = :desc) { order(created_at: direction)}
end
