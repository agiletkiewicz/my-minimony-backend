class Post < ApplicationRecord
    include Rails.application.routes.url_helpers

    belongs_to :user
    has_many :boards_post, dependent: :destroy
    has_many :boards, through: :boards_post
    
    validates :title, :description, presence: true 

    has_one_attached :image

    def get_image_url
        if self.image_url != ""
            self.image_url
        else
            url_for(self.image)
        end
      end

end