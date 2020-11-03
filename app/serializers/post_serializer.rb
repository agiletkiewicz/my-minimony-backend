class PostSerializer
    include JSONAPI::Serializer
    set_key_transform :camel_lower

    attributes :title, :description, :url, :image_url, :id
end