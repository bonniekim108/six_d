class Invitation < ActiveRecord::Base
  has_one :recipient
  belongs_to :sender

  before_create :generate_token

private

  def recipient_is_not_registered
    errors.add :recipient_email, 'is already registered' if User.find_by_email(recipient_email)
  end

  def generate_token
  end

  def sender_has_invitations
  end
  
end



