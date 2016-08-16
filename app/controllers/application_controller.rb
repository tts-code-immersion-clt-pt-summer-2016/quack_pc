class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def configure_devise_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation,
      :name, :username, :bio, :location) }

    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation,
      :current_password, :name, :username, :bio, :location) }
  end
end
