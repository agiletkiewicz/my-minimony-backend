class Api::V1::BoardsController < ApplicationController

    def index 
        boards = current_user.boards 
        render json: BoardSerializer.new(boards)
    end


    def create 
        board = current_user.boards.build(board_params)
        if board.save
            render json: BoardSerializer.new(board)
        else
            board.save
            render json: {errors: board.errors.full_messages}
        end
    end

    def show 
        board = Board.find_by(id: params[:id])
        posts = board.posts
        render json: PostSerializer.new(posts)
    end

    private 

    def board_params
        params.require(:board).permit(:title)
    end

end
