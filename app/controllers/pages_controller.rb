class PagesController < ApplicationController

  before_action :set_cat_emoji

  def home
    redirect_to blogs_path if logged_in?
  end

  def about
  end

  def set_cat_emoji
    @cat_emoji = cat_emoji_list.sample
  end

end
