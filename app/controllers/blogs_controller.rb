class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(from_param)
    @blog.user = User.first
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



  private
  def set_blog
    @blog = Blog.find(params[:id])
  end

  def from_param
    params.require(:blog).permit(:title, :content)
  end
end
