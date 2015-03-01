class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password)
      log_in user
      redirect_to user #redirects to user's profile page upon log in
    else
      flash.now[:danger] = 'Invalid login'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end