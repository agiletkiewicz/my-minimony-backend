class BoardSerializer
    include JSONAPI::Serializer
    set_key_transform :camel_lower

    attributes :title, :id, :image, :image_one, :image_two, :image_three, :image_four

    has_many :boards_post, serializer: BoardsPostSerializer
    
end