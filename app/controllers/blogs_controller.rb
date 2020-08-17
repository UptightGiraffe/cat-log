class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @blogs = Blog.paginate(page: params[:page], per_page: 3)
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(from_param)
    @blog.user = current_user
    if @blog.save
      flash[:notice] = "Blog title \"#{@blog.title}\" was saved sucessfully."
      redirect_to blogs_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @blog.update(from_param)
      flash[:notice] = "Blog title \"#{@blog.title}\" was saved sucessfully."
      redirect_to blogs_path
    else
      render 'edit'
    end
  end

  def destroy

    @blog.destroy
    redirect_to blogs_path
  end


  private
  def set_blog
    @blog = Blog.find(params[:id])
  end

  def from_param
    params.require(:blog).permit(:title, :content)
  end

  def require_same_user
    if current_user != @blog.user
      flash[:alert] = "You can only edit or delete your own blog!"
      redirect_to @blog
    end
  end
end
