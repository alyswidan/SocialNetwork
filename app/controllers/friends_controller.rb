class FriendsController < ApplicationController

  def create
    @user = User.find(params[:other_user_id])
    helpers.current_user.send_request(@user)
    respond_to do |format|
      format.html{ redirect_to @user}
      format.js
    end
  end
  def destroy
    helpers.current_user.remove_friend(params[:user_id])
    redirect_to User.find(params[:user_id])


  end
end

