class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # if user exists and password is correct
    if user && user.authenticate(params[:password])
      #save user id inside browser cookie. This keeps user logged in when they navigate around website
      session[:user_id] = user.id
      redirect_to root_path
   
    else
      flash[:danger] = "Incorrect username and/ or password"
      redirect_to '/login'
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
