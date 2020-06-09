class Post < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :comment, presence: true
  validates :rating, presence: true, :inclusion => 1..5

  def self.search(search)
    if search
      post_type = Post.find_by(title: search)
        if post_type
          self.where(post_title: post_type)
        else
          @posts = Post.all
        end
      else
        @posts = Post.all
      end
    end
  
end
