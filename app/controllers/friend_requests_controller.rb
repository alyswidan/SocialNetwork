class FriendRequestsController < ApplicationController

  def create
    @user = nil
    @is_received = helpers
                       .current_user
                       .is_receive_request?(User
                                                .find_by(id: params[:user_id]))
    if @is_received
      f_request = helpers.current_user
                      .received_requests
                      .find_by!(user_id: params[:user_id])
      helpers.current_user.accept_request(f_request)
      @user = User.find(params[:user_id])
    else
      helpers.current_user.send_request(params[:other_user_id])
      @user = User.find(params[:other_user_id])
      respond_to do |format|
        format.html{ redirect_to current_user}
        format.js
      end
    end


  end

  def destroy

    helpers.current_user.remove_request(params[:other_user_id])
    @user = User.find(params[:other_user_id])
    respond_to do |format|
      format.html{ redirect_to current_user}
      format.js
    end

  end
end
