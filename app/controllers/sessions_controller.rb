class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    admin = AdminUser.find_by(username: params[:session][:username])
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid username/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
  
end
