class StaticPagesController < ApplicationController

  def home
    @post = helpers.current_user.posts.build if helpers.logged_in?
    @feed_items = helpers.current_user.feed.paginate(page: params[:page])
  end

  def help

  end

  def about

  end

  def contact

  end

end