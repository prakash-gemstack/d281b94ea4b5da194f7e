class UsersController < ApplicationController
  def follow
    follower = current_user.user_followers.build(follower_id: params[:id])
    redirect_to root_path, alert: follower.errors.full_messages.join(',') and return unless follower.save

    redirect_to root_path, notice: 'Followed successfully'
  end
end
