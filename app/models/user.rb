class User < ApplicationRecord
    has_many :posts
    has_many :boards
    has_many :boards_posts, through: :boards

    has_secure_password

    # validates :username, :uniqueness
    # validates :username, presence: true

end