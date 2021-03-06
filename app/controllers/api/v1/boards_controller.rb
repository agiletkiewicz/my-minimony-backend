class Api::V1::BoardsController < ApplicationController

    def index 
        if params[:post_id]
            post = Post.find_by(id: params[:post_id])
            render json: BoardSerializer.new(post.boards)
        else
            boards = current_user.boards 
            options = {include: [:boards_post]}
            render json: BoardSerializer.new(boards, options)
        end
    end


    def create 
        board = current_user.boards.build(board_params)
        if board.save
            render json: BoardSerializer.new(board)
        else
            board.save
            render json: {error: board.errors.full_messages}
        end
    end

    def show 
        board = Board.find_by(id: params[:id])
        posts = board.posts
        render json: {
            board: BoardSerializer.new(board),
            posts: PostSerializer.new(posts)
        }
    end

    def destroy 
        board = Board.find_by(id: params[:id])
        if board
            board.destroy
            render json: {
            status: 200
            }
        end
    end

    private 

    def board_params
        params.require(:board).permit(:title)
    end

end
