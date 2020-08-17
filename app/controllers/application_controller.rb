class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

  private
  def cat_emoji_list
    ["1F638", "1F639", "1F63A", "1F63B", "1F63C", "1F63D", "1F981", "1F42F", "1F431"]
  end
end
