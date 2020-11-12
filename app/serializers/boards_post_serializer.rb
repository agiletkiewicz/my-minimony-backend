class BoardsPostSerializer
    include JSONAPI::Serializer
    set_key_transform :camel_lower
    
    attributes :id, :post_id, :board_id
    
    
end