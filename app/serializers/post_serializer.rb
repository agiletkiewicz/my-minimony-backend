class PostSerializer
    include JSONAPI::Serializer
    set_key_transform :camel_lower

    attributes :title, :description, :url, :id

    attribute :image_url do |object|
        "#{object.get_image_url}"
    end

end