class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :track_action

  protected

  def allowed?
    if current_user.nil? || current_user.role != "admin"
      redirect_to root_path
    end
  end

  def track_action
    ahoy.track "Ran action", request.path_parameters
  end

end
