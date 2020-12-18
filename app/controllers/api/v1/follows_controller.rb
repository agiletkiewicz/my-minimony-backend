class Api::V1::FollowsController < ApplicationController

    def create 
        follow = Follow.new(follow_params)
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

    def boardspost_params
        params.require(:follow).permit(:board_id, :user_id)
    end

end
