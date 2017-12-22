class FriendRequestsController < ApplicationController

  def create

    if helpers.current_user.is_receive_request?(User.find_by(id: params[:user_id]))
      then
      x=helpers.current_user.
          received_requests.
          find_by!(user_id: params[:user_id])
      helpers.current_user.accept_request(x)
    else
      helpers.current_user.send_request(params[:other_user_id])
    end
  end

  def destroy
    helpers.current_user.remove_request(params[:other_user_id])

  end
end
