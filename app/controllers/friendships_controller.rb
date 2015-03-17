class FriendshipsController < ApplicationController

  def new
    @friendship = Friendships.new
  end  
  
  # if the invitee email matches the email that the user sent, then they automatically become friends. 
  def create
    if params[:invitee_email]
      @friend = User.where(params[:invitee_email])
      @friendship = current_user.friendships.new(invitee_email :@friend)
      if @friendship.save
        flash[:success] = "Congrats! You are now friends."
      else
        flash[:error] = "Oops! There's been a mistake."
        redirect_to profile_path(@friend)
      end
    end
  end
end