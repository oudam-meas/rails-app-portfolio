class PagesController < ApplicationController
  def home
    @post = Blog.all
  end

  def about
  end

  def contact
  end
end
