class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate_session
  
private

  def authenticate_session
    flash[:notice] = nil
    flash[:error] = nil
    
    # admin is logged in
    if session[:admin]
      @admin = Ecnuser.where(["id = ? ", session[:admin] ]).first
      @reports = []
      reports = @admin.ecnposition.doc_categories
      reports.each { |report|
        first_position = report.ecnpositions.order("id asc").limit(1).first
        if @admin.ecnposition.id <= first_position.id
          @reports << report
        end
      }
    # user is logged in
    elsif session[:user]
      @user = Ecnuser.where(["id = ? ", session[:user] ]).first
      @reports = []
      reports = @user.ecnposition.doc_categories
      reports.each { |report|
        first_position = report.ecnpositions.order("id asc").limit(1).first
        if @user.ecnposition.id <= first_position.id
          @reports << report
        end
      }
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
