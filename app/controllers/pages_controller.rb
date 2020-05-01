class PagesController < ApplicationController

  before_action :set_cat_emoji

  def home
  end

  def about
  end

  def set_cat_emoji
    @cat_emoji = cat_emoji_list.sample
  end
  
end
