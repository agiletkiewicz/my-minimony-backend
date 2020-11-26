class User < ApplicationRecord
    has_many :posts
    has_many :boards
    has_many :boards_post, through: :boards

    has_secure_password

    validates :username, uniqueness: true
    validates :username, presence: true

end