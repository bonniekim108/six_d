class UsersController < ApplicationController
  respond_to :json

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to @user, notice: "Signed up successfully."
      else
        render :new
      end
    end

      respond_to do |format|
        if @user.save
          #Tell the UserMailer to send a welcome email after save
          UserMailer.welcome_email(@user).deliver_now

          format.html { redirect_to@user, notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end

    def welcome_email(user)
      @user = user
      email_with_name = %("#{@user.username}" <#{@user.email}>)
      mail(to: email_with_name, subject: 'Welcome to Six Degrees!')

      end
    end

  private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)  
    end

end

















