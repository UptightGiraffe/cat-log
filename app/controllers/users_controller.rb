class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_user, only: [:edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def show
    @blogs = @user.blogs.paginate(page: params[:page], per_page: 3)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def create
    @user = User.new(from_param)
    if @user.save
      redirect_to blogs_path, notice: "Welcome to Cat Log, #{@user.user_name}. You have sucessfully signed up ."
      session[:user_id] = @user.id
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(from_param)
      redirect_to @user, notice: "User \"#{@user.user_name}\" sucessfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "Account and all associated blogs and kitty moments deleted"
    redirect_to root_path
  end

  private
  def from_param
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own profile!"
      redirect_to @user
    end
  end
end
