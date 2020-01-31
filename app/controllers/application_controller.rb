class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
   @current_user =  User.find(session[:user_id]) if session[:user_id]
  # if @current_user
  #   redirect_to signup_path
  # end
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      redirect_to login_path
    end
  end

end
