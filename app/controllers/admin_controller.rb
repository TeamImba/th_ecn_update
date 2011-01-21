class AdminController < ApplicationController
  layout false
  def index
    if request.post?
      message, @admin = Ecnuser.authenticate_admin( params[:login][:username], params[:login][:password] )
      if message == "successful"
        session[:admin] = @admin
        redirect_to admin_path
      else
        flash[:error] = message
      end
    elsif session[:admin]
      render :action => "menu", :layout => "application"
    end
	end
  
  
	def destroy
		session[:admin] = nil
    @admin = nil
		flash[:notice] = "Thank you for using our Tonghsing System!"
		render :action => :index	
	end
  
end
