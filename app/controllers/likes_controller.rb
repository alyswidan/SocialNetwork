class LikesController < ApplicationController


  def create
    @post = Post.find(params[:post_id])
     helpers.current_user.like(@post.id)
     respond_to do |format|
       format.html { redirect_to current_user }
       format.js
     end

  end

  def destroy
    @post = Post.find(params[:post_id])
    helpers.current_user.unlike(@post.id)
    respond_to do |format|
      format.html { redirect_to current_user }
      format.js
    end
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

