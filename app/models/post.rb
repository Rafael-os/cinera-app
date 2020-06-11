class Post < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :comment, presence: true
  validates :rating, presence: true, :inclusion => 1..5  
end
