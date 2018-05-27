class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :track_action
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

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
