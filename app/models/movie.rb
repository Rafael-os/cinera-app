class Movie < ApplicationRecord
  has_many :posts
  belongs_to :genre
end
