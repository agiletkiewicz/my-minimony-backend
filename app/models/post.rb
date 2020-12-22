class Post < ApplicationRecord
    belongs_to :user
    has_many :boards_post, dependent: :destroy
    has_many :boards, through: :boards_post
    
    validates :title, :description, :image_url, presence: true 

    has_one_attached :attachment

    def attachment_url
        Rails.application.routes.url_helpers.rails_representation_url(
          attachment.variant(resize_to_limit: [200, 200]).processed, only_path: true
        )
    end

end