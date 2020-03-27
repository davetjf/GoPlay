class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :commonMethod 
  
  def commonMethod
    @users = User.all
	end
  


  protected



  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :avatar_url, :email, :password)}
	devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :avatar_url, :email, :password, :current_password)}
  end


end
