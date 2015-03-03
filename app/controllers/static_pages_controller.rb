class StaticPagesController < ApplicationController
  def home
    @notification = current_user.notifications.build if logged_in? 
  end
  # @micropost variable defined only if there is a current logged in user
end
