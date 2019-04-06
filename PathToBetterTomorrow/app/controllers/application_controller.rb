class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  def current_user
    @current_user ||= User.find_by(session_token: params[:session_token])
  end

  def login!(user)
    session[:session_token] = user.reset_session_token
  end 

#log_out

  def log_out
    session[:session_token] = nil 
    if current_user 
      current_user.reset_session_token
    end 
    @current_user = nil
    redirect_to users_url
  end

#logged_in?
  def logged_in?
    !!(current_user)
  end 


end
