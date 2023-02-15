class SessionsController < ApplicationController
  include ApplicationHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash_message("Welcome back, #{user.username}!")
      redirect_to user
    else
      flash_error("Invalid email/password combination")
      render "new"
    end
  end

  def destroy
    flash_message("You have been logged out") if session[:user_id]
    session[:user_id] = nil

    redirect_to root_path
  end
end
