class Api::V1::BoardspostController < ApplicationController


    def create 
        boards_post = BoardsPost.new(boardspost_params)
        if boards_post.save
            render json: {
                status: 200,
                save: BoardsPostSerializer.new(boards_post)
            }
        else
            boards_post.save
            render json: {errors: boards_post.errors.full_messages}
        end
    end

    def destroy 
        boards_post = BoardsPost.find_by(id: params[:id])
        if boards_post
            boards_post.destroy
            render json: {
            status: 200
            }
        end
    end



    private 

    def boardspost_params
        params.require(:boardspost).permit(:board_id, :post_id)
    end

end
