class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate_session
  
private

  def authenticate_session
    flash[:notice] = nil
    flash[:error] = nil
    
    # admin is logged in
    if session[:admin]
      @admin = session[:admin]
    # user is logged in
    elsif session[:user]
      @user = session[:user]
    # unlogged user is trying to login via /login or /admin_login
    # nothing to worry about because these two controller has only login and logout function
  	elsif params[:controller] != "Login" && params[:controller] != "Admin"
      redirect_to login_path
    end
	end
  
  def authenticate_admin
    flash[:notice] = nil
    flash[:error] = nil
  	if session[:admin].blank?
      redirect_to admin_login_path
    else
      @admin = session[:admin]
    end
  end
  
  
end
