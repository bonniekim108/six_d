class FriendshipsController < ApplicationController

  def new
    @friendship = Friendships.new
  end  
  
  def create
    if params[:invitee_email]
      @friend = User.where(params[:invitee_email])
      @friendship = current_user.friendships.new(invitee_email :@friend)
      if @friendship.save
        flash[:success] = "Congrats! You are now friends."
      else
        flash[:error] = "Sorry, there's a problem."
        redirect_to profile_path(@friend)
      end
    end
  end
end