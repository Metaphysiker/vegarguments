class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def allowed?
    if current_user.nil? || current_user.role != "admin"
      redirect_to root_path
    end
  end

end
