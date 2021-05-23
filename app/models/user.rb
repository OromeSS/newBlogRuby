class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :rememberable,  :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
  belongs_to :role
  has_many :posts
end
