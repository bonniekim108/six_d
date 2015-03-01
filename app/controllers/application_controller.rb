class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include SessionsHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user])
  end

  def logged_in?
    curent_user != nil
  end
  # before_action :authenticate_user!

  # def index
  # end

  # def authenticate_user!
  #   if current_user.nil?
  #     redirect_to root_path
  #   end
  # end
  
end
