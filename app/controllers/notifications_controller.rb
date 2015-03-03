class NotificationsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @notification = current_user.notifications.build(notification_params)
    if @notification.save
      flash[:success] = "Notification created! Great!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def notification_params
      params.require(:notification).permit(:content)
    end
end


















