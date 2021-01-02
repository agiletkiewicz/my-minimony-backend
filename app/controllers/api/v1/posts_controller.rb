require 'open-uri'

class Api::V1::PostsController < ApplicationController

    def index
        if params[:user_id]
            posts = User.find_by(id: params[:user_id]).posts
            render json: PostSerializer.new(posts)
        else
            posts = Post.all.sort { |a,b| b.created_at <=> a.created_at }
            render json: PostSerializer.new(posts)
        end
    end

    def create 

        if invalid_image_url? 
            render json: {
                status: 422, 
                error: "Invalid image URL"
            }
            return
        end

        if invalid_url? 
            render json: {
                status: 422, 
                error: "Invalid URL"
            }
            return
        end

        post = current_user.posts.build(post_params)

        if post.save
            render json: PostSerializer.new(post)
        else
            post.save
            render json: {
                status: 422, 
                error: post.errors.full_messages
            }
        end
    end

    def destroy 
        post = Post.find_by(id: params[:id])
        if post
            post.destroy
            render json: {
            status: 200
            }
        end
    end

    private 

    def post_params
        params.permit(:title, :description, :image_url, :url, :image)
    end

    def invalid_image_url?
        if params[:image_url] != ""
            begin 
                open(params[:image_url]).status != ["200", "OK"]
            rescue Errno::ENOENT
                true
            else 
                false
            end
        else 
            false 
        end
    end

    def invalid_url?
        if params[:url] != ""
            begin 
                open(params[:url]).status != ["200", "OK"]
            rescue Errno::ENOENT
                true
            else 
                false
            end
        else
            false
        end
    end

end
