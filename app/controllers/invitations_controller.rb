class InvitationsController < ApplicationController

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      UserMailer.invitation_email(params[:invitee_email])

      redirect_to profiles_path
    else
     
      render :action => 'new'
    end
  end

private
  def invitation_params
    params.require(:user).permit(:user_email, :invitee_email, :user_full_name, :invitee_full_name)
  end

end


