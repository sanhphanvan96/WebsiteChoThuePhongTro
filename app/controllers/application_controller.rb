class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password,
      :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :name, :email,
      :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email,
      :password, :password_confirmation, :current_password, :address, :phone])
  end
end
