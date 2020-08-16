class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
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

  private
  def from_param
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
