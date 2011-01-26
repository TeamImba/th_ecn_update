class LoginController < ApplicationController
  layout false
  def index
    if request.post?
      message, @user = Ecnuser.authenticate(params[:login][:username], params[:login][:password])
      if message == "successful"
        session[:user] = @user.id
        redirect_to ecndocuments_path
      else
        flash[:error] = message
      end
    end
	end
  
  
	def destroy
		session[:user] = nil
    @user = nil
		flash[:notice] = "Thank you for using our Tonghsing System!"
		render :action => :index	
	end
end
