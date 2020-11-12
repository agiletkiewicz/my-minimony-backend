class BoardSerializer
    include JSONAPI::Serializer
    attributes :title, :id, :boards_posts

    has_many :posts
    has_many :boards_posts, serializer: BoardsPostSerializer
    
end