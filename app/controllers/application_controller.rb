class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :residence, :phone_number, :email, :encrypted_password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

  def after_sign_in_path_for(resource)
  case resource
  when Farmer
    farmer_path(current_farmer.id)
  when User
    user_path(current_user.id)
  end
  end
end
