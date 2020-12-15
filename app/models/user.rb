class User < ApplicationRecord
    has_many :posts
    has_many :boards
    has_many :boards_post, through: :boards
    has_many :follows
    has_many :followed_boards, through: :follows, source: :board

    has_secure_password

    validates :username, uniqueness: true
    validates :username, presence: true

end