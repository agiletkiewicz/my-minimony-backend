class Board < ApplicationRecord
  belongs_to :user
  has_many :boards_post
  has_many :posts, through: :boards_post

  validates :title, presence: true

end
