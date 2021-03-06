class Api::V1::FollowsController < ApplicationController

    def create 
        follow = Follow.new(board_id: params[:board_id], user_id: params[:user_id])

        if follow.save
            render json: {
                status: 200,
                follow: FollowSerializer.new(follow)
            }
        else
            follow.save
            render json: {errors: follow.errors.full_messages}
        end
    end

    def destroy 
        follow = Follow.find_by(id: params[:id])
        if follow
            follow.destroy
            render json: {
            status: 200
            }
        end
    end

    private 

    def follow_params
        params.require(:follow).permit(:board_id, :user_id)
    end

end
