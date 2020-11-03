class Post < ApplicationRecord
    belongs_to :user

    validates :title, presence: true 
    validates :description, presence: true 
    validates :image_url, presence: true 

end