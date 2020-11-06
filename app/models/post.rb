class Post < ApplicationRecord
    belongs_to :user
    has_many :boards_posts
    has_many :boards, through: :boards_posts

    validates :title, presence: true 
    validates :description, presence: true 
    validates :image_url, presence: true 

end