class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    # email_with_name = %("#{@user.name}" <#{@user.email}>)
    mail(to: @user.email, subject: "Welcome to Six Degrees")
  end

  def invitation(invitee)
    @invitee = invitee
    # email_with_name = %("#{@invitee.name}" <#{@invitee.email}>)
    mail(to: @invitee.email, subject: "Invited to Join Six Degrees")
  end


end
