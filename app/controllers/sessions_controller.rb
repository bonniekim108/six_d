class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path
      #if user.activated? # lets users log in only if they are activated. 
        #log_in user
        #params[:session][:remember_me] == '1'? remember(user) :forget(user)
        #redirect_to profile_path
        #message = "Account not activated. Check email for activation link."
        #flash[:warning] = message
        #redirect_to root_url
      #end
    else
      # flash.now[:danger] = 'Login error - please check your email and password.'
      render 'new'
    end
  end
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
