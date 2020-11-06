class UserSerializer
    include JSONAPI::Serializer
    attributes :id, :name, :username

    has_many :boards
    
end