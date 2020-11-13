class BoardSerializer
    include JSONAPI::Serializer
    attributes :title, :id, :image
    set_key_transform :camel_lower

    has_many :boards_post, serializer: BoardsPostSerializer
    
end