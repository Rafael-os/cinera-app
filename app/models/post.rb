class Post < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :comment, presence: true
  validates :rating, presence: true, numericality: true, :inclusion => {:in => 1..5, :message => "Rating must be between 1 and 5"}
  
  include PgSearch::Model
  pg_search_scope :global_search,
    associated_against: {
      movie: [ :title, :director ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
