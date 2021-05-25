class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments
  validates :title, presence: true

  scope :filtered, ->(query_params) { Post.new.filter(self, query_params) }
  scope :categorized, ->(query_params) { Post.new.category_filter(self, query_params) }
  scope :ordered, ->(direction = :desc) { order(created_at: direction)}
  
  def filter(scope, query_params)
    if query_params[:text].present?
      scope = scope.where("title ILIKE :text OR body ILIKE :text", text: "%#{query_params[:text]}%")
    end
    scope
  end

  def category_filter(scope, query_params)
    if query_params[:category_id].present?
      scope = scope.where(category_id: query_params[:category_id])
    end
    scope
  end
end
