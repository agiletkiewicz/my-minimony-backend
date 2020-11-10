class BoardSerializer
    include JSONAPI::Serializer
    attributes :title, :id

    has_many :posts
    
end