class Board < ApplicationRecord
  belongs_to :user
  has_many :boards_posts
  has_many :posts, through: :boards_posts

  validates :title, presence: true

end
