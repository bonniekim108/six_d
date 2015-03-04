class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include SessionsHelper

  private

   # Confirms that user is logged in. 
  def logged_in_user
    unless logged_in?
      redirect_to login_url
    end
  end

  def logged_in? 
    current_user
  end
  helper_method :logged_in?

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    elsif cookies.permanent.signed[:remember_me_token]
      verification = Rails.application.message_verifier(:remember_me).verify(cookies.permanent.signed[:remember_me_token])
      if verification
        Rails.logger.info "Logging in through cookie"
        @current_user ||= User.find(verification)
      end
    end
  end
  helper_method :current_user

  def require_user
    if current_user
      true
    else
      redirect_to new_user_session_path, notice: "You must be logged in to access this page."
    end
  end  
end
