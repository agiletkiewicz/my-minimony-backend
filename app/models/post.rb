class Post < ApplicationRecord
    belongs_to :user
    has_many :boards_post, dependent: :destroy
    has_many :boards, through: :boards_post

    validates :title, :description, :image_url, presence: true 

end