class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  include ApplicationHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Returns true if a user is currently authenticated, false otherwise
  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash_message("You must be logged in to perform that action", :alert)
      redirect_to login_path
    end
  end
end
