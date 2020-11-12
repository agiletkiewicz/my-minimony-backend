class Board < ApplicationRecord
  belongs_to :user
  has_many :boards_post, dependent: :destroy
  has_many :posts, through: :boards_post

  validates :title, presence: true

end
