class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password is correct
    if user && user.authenticate(params[:password])
    #Save the user id inside the browser cookie. This keeps the user logged in while they move around the website.  
      session[:user_id] = user.id
      redirect_to '/'
    else
    # if login doesn't work, send them back to login form
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end