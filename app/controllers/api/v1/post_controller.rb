class Api::V1::PostController < ApplicationController

    def index
        posts = Post.all
        render json: posts
    end

end
