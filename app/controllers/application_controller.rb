class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def stored_location_for(_admin)
    nil
  end

  def after_sign_in_path_for(_admin)
    root_path
  end

  def default_url_options
    { host: ENV['APP_URL'] || 'localhost:3000' }
  end
end
