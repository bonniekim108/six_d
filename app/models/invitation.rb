class Invitation < ActiveRecord::Base
  has_one :invitee
  belongs_to :user

  before_create :generate_token

private

  def recipient_is_not_registered
    errors.add :invitee_email, 'is already registered' if User.find_by_email(invitee_email)
  end

  def generate_token
  end

  def sender_has_invitations
  end
  
end



