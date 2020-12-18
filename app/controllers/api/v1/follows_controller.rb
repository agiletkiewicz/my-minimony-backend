class Api::V1::FollowsController < ApplicationController

    def create 
        follow = Follow.new(board_id: params[:board_id], user_id: params[:user_id])

        if follow.save
            render json: {
                status: 200,
                follow: follow
            }
        else
            follow.save
            render json: {errors: follow.errors.full_messages}
        end
    end

    def destroy 

    end

    private 

    def follow_params
        params.require(:follow).permit(:board_id, :user_id)
    end

end
