# class NotificationsController < ApplicationController

#   before_action :logged_in_user, only: [:create, :destroy]
#   before_action :correct_user, only: :destroy

#   def index
#     @notifications = current_user.notifications

#   def new
#     @notification = Notification.new

#   def create
#     @notification = Notification.new(params.require(:notification).permit(:body))
#     if @notification.save
#       flash[:success] = "A new notification has been created"
#     else
#       render :new
#     end
#   end

#   def destroy
#     @notification.destroy
#     flash[:success] = "Notification deleted"
#     redirect_to request.referrer || root_url
#     # request.referrer redirects back to page giving delete request both cases
#   end

#   private

#     def notification_params
#       params.require(:notification).permit(:content, :picture)
#     end

#     def correct_user
#       @notification = current_user.notifications.find_by(id: params[:id])
#       redirect_to root_url if @notification.nil?
#     end
# end


















