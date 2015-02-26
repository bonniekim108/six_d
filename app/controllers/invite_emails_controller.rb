class InvitationsController < ApplicationController

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(params[:invitation])
    if @invitation.save
      flash[:notice] = "Invitation sent."
      redirect_to projects_url
    else
      flash.now[:notice] = "Error"
      render :action => 'new'
    end
  end
end


