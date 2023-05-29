class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  # declare or permit variable in devise before start application
  def configure_permitted_parameters
    added_attrs = %i[name email password password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: %i[email password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
