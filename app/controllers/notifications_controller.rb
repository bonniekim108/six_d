class NotificationsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @notification = current_user.notifications.build(notification_params)
    if @notification.save
      flash[:success] = "Notification created! Great!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @notification.destroy
    flash[:success] = "Notification deleted"
    redirect_to request.referrer || root_url
    # request.referrer redirects back to page giving delete request both cases
  end

  private

    def notification_params
      params.require(:notification).permit(:content)
    end

    def correct_user
      @notification = current_user.notifications.find_by(id: params[:id])
      redirect_to root_url if @notification.nil?
    end
end


















