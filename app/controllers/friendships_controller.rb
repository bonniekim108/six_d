class FriendshipsController < ApplicationController

  def new
    if params[:invitee_id] #if friend id parameter is there, find a friend based on that id and assign it to variable friend
      @invitee = User.where(profile_name: params[:invitee_id]).first
      @friendship = current_user.friendships.new(invitee: @invitee)
    else
      flash[:error] = "Friend needed"
    end
  end

  def create
    if params [:invitee_id]
      @invitee = User.where(profile_name: params[:invitee_id]).first
      @friendship = current_user.friendships.new(invitee: @invitee)
      if @friendship.save
        flash[:success] = "You are now friends with #{@invitee.full_name}."
      else
        flash[:error] = "Error"
      end
      redirect_to profile_path(@invitee)
    else
      flash[:error] = "You need to add a friend."
      redirect_to root_path
    end
  end
end





