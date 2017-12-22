class LikesController < ApplicationController


  def create

     helpers.current_user.like(params[:post_id])



  end

  def destroy
    post.likes.where(user: current_user).destroy_all
    redirect_to user, :notice => 'Unliked!'
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

