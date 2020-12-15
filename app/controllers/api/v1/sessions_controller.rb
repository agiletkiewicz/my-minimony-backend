class Api::V1::SessionsController < ApplicationController
    
    def create
        @user = User.find_by(username: session_params[:username])
        if @user && @user.authenticate(session_params[:password])
          login!
          options = {include: [:boards_post]}
          render json: {
            logged_in: true,
            user: UserSerializer.new(current_user),
            boards: BoardSerializer.new(current_user.boards, options), 
            follows: BoardSerializer.new(current_user.followed_boards)
          }
        else
          render json: { 
            status: 401, 
            error: "Could not authenticate your account"
          }
        end
      end

    def is_logged_in?
        if logged_in? && current_user
          options = {include: [:boards_post]}
          render json: {
            logged_in: true,
            user: UserSerializer.new(current_user),
            boards: BoardSerializer.new(current_user.boards, options), 
            follows: BoardSerializer.new(current_user.followed_boards)
          }
        else
          render json: {
            logged_in: false
          }
        end
      end

    def destroy
        logout!
        render json: {
          status: 200,
          logged_out: true
        }
      end

    private

    def session_params
        params.require(:user).permit(:username, :name, :password)
    end

end