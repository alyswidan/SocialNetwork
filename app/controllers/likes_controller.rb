class LikesController < ApplicationController


  def create

     helpers.current_user.like(params[:post_id])

  end

  def destroy
    helpers.current_user.unlike(params[:post_id])

  end
  #
  # private

  # def post
  #   @post ||= Post.find(params[:post_id])
  # end

  # def find_post
  #   @post = Post.find(params[:id])
  # end
end

