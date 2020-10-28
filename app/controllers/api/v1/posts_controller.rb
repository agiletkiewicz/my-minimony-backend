class Api::V1::PostsController < ApplicationController

    def index
        posts = Post.all
        render json: posts
    end

    def create 
        post = Post.new(post_params)
        post.user = User.last
        if post.save
            render json: post
        else
            render json: {error: 'Error creating post'}
        end
    end

    private 

    def post_params
        params.require(:post).permit(:title, :description, :image_url, :url)
    end

end
