class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  rescue_from ActionController::RoutingError, with: :render_root

  private

  def render_root
    redirect_to root_path
  end
end
