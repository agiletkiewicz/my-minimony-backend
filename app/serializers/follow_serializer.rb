class FollowSerializer
    include JSONAPI::Serializer
    set_key_transform :camel_lower
    
    attributes :id, :user_id, :board_id
    
    
end