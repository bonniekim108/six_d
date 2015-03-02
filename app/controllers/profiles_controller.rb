class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:id])
    if @user 
      @invitees = @user.invitees.all  
       render actions: :show
     else # in case there's no user, it'll render 404 page
       render file: 'public/404', status: 404, formats: [:html]
     end
   end

  private
  
    def users_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)  
    end
  end


