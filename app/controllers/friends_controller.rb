class FriendsController < ApplicationController
  before_action :logged_in_user
  def create
    @user = User.find(params[:other_user_id])
    current_user.send_request(@user)
    respond_to do |format|
      format.html{ redirect_to @user}
      format.js
    end
  end
  def destroy
    @user = Friend.find(params[:id]).other_user

    current_user.remove_friend(@user)
    redirect_to do |format|
      format.html { redirect_to @user}
      format.js
    end

  end
end

