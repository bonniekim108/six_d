class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @notification = current_user.notifications.build
      @feed_items = current_user.feed(page:params[:page])
    end
  end
end
