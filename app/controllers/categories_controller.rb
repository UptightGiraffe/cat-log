class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except: [:index, :show]

  def new
    @category = Category.new
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 4)
  end

  def show
    @category
  end

  def create
    @category = Category.new(from_param)
    if @category.save
      flash[:notice] = "sucessfully saved."
      redirect_to @category
    else
      render 'new'
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def from_param
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform that action"
      redirect_to categories_path
    end
  end
end
