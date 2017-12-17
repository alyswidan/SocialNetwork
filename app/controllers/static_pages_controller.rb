class StaticPagesController < ApplicationController

  def home
    @post = helpers.current_user.posts.build if helpers.logged_in?
  end

  def help

  end

  def about

  end

  def contact

  end

end