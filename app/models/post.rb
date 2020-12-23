class Post < ApplicationRecord
    belongs_to :user
    has_many :boards_post, dependent: :destroy
    has_many :boards, through: :boards_post
    
    validates :title, :description, :image_url, presence: true 

    has_one_attached :image

    def get_image_url
        Rails.application.routes.url_helpers.rails_representation_url(
          attachment.variant(resize_to_limit: [200, 200]).processed, only_path: true
        )
    end

    # def get_image_url
    #     url_for(self.image)
    #   end

end