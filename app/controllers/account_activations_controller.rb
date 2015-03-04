class AccountActivationsController < ApplicationController
  #Edit action activates accounts
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      redirect_to user
    else
      flash[:danger] = "Invalid link."
      redirect_to root_url
    end
  end
end
