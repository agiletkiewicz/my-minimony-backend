class ApplicationController < ActionController::API
  before_action :transform_params
  
  def login!
    session[:user_id] = @user.id
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def logout!
    session.clear
  end

  def transform_params
    request.parameters.deep_transform_keys!(&:underscore)
  end
  
end
