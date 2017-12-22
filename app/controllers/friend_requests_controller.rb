class FriendRequestsController < ApplicationController

  def create
    helpers.current_user.send_request(params[:other_user_id])
  end
end
