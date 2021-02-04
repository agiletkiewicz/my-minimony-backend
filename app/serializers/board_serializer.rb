class BoardSerializer
    include JSONAPI::Serializer
    attributes :title, :id, :image, :image_one, :image_two, :image_three, :image_four
    set_key_transform :camel_lower

    has_many :boards_post, serializer: BoardsPostSerializer
    
end