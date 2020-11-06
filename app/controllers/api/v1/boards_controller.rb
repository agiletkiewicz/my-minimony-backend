class Api::V1::BoardsController < ApplicationController


    def create 
        board = current_user.boards.build(board_params)
        if board.save
            render json: BoardSerializer.new(board)
        else
            board.save
            render json: {errors: board.errors.full_messages}
        end
    end

    private 

    def board_params
        params.require(:board).permit(:title)
    end

end
