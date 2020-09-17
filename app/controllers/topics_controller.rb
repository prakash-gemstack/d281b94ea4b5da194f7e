class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    render 'new' and return unless @topic.save

    redirect_to questions_path, notice: 'Topic created'
  end

  def follow
    follower = current_user.topic_followers.build(topic_id: params[:id])
    redirect_to root_path, alert: follower.errors.full_messages.join(',') and return unless follower.save

    redirect_to root_path, notice: 'Followed successfully'
  end

  private

  def topic_params
    params.require(:topic).permit(:topic)
  end
end
