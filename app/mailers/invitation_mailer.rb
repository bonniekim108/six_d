class InvitationMailer < ActionMailer::Base
  default from: "blah"

  def invitation(invitation, signup_url)
    subject     "Invitation"
    recipients  @recipient_email
    from        "donotreply@example.com"
    body        :invitation => invitation, :signup_url => signup_url
    invitation.update_attribute(:sent_at, Time.now)
  end
end 