class FriendsController < ApplicationController

  def create

  end
  def destroy
    helpers.current_user.remove_friend(params[:user_id])
    redirect_to User.find(params[:user_id])
    respond_to do |format|
      format.html{ redirect_to current_user}
      format.js
    end

  end
end

