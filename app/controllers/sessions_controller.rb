class SessionsController < ApplicationController
  def new
    if logged_in?
      flash[:alert] = "You have already signed in."
      redirect_to root_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to user
    else
      flash.now[:alert] = "Email and password combination not found"
      render 'new'
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
      flash[:notice] = "Logged out"
      redirect_to root_path
    else
      flash[:alert] = "Log in first before log out"
      redirect_to root_path
    end
  end


end
