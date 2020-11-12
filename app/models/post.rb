class Post < ApplicationRecord
    belongs_to :user
    has_many :boards_post
    has_many :boards, through: :boards_post

    validates :title, presence: true 
    validates :description, presence: true 
    validates :image_url, presence: true 

end