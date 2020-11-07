class Api::V1::BoardspostController < ApplicationController


    def create 
        board_post = BoardsPost.new(boardspost_params)
        if board_post.save
            render json: {
                status: 200
            }
        else
            board_post.save
            render json: {errors: board_post.errors.full_messages}
        end
    end

    private 

    def boardspost_params
        params.require(:boardspost).permit(:board_id, :post_id)
    end

end
