class Api::V1::PostsController < ApplicationController

    def index
        posts = Post.all.sort { |a,b| b.created_at <=> a.created_at }
        render json: PostSerializer.new(posts)
    end

    def create 
        byebug
        post = current_user.posts.build(post_params)
        if post.save
            render json: PostSerializer.new(post)
        else
            post.save
            render json: {errors: post.errors.full_messages}
        end
    end

    private 

    def post_params
        params.require(:post).permit(:title, :description, :image_url, :url)
    end

end
