class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?
  helper_method :resource_name, :resource, :devise_mapping, :resource_class
  protect_from_forgery

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :description, :email, :password, :password_confirmation, :avatar)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :description, :email, :password, :password_confirmation, :current_password, :avatar)}
  end
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
