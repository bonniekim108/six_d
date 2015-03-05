class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy # before filter restricts destroy action to admins only
  respond_to :json

    def index
      @users = User.all
    end 

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(users_params)

        if @user.save
          #Tell the UserMailer to send a welcome email after user is created
          UserMailer.welcome_email(@user).deliver_now

          redirect_to user_path(@user.id)

          #check for invites
          invitations = Invitation.where(invitee_email: @user.email)
          # for each invite where the invitee email equals the new user's email
          invitations.each do |invitation|
            #friendship from invitee to user created
            Friendship.create(from_id: @user.id, to_id: invitation.user_id)
            #friendship from user to invitee
            Friendship.create(from_id: invitation.user_id, to_id: @user.id)
          end

        else
          redirect_to root_url
        end

    end


    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
      else
        render 'edit'
      end
    end

    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to users_url
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end


    def welcome_email(user)
      @user = user
      email_with_name = %("#{@user.username}" <#{@user.email}>)
      mail(to: email_with_name, subject: 'Welcome to Six Degrees!')
    end


  private
  
    def users_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)  
    end 

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
  end


















