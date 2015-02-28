class User < ActiveRecord::Base

  has_secure_password 
  has_many :sent_invitations
  belongs_to :invitation

  validates :password, length: { minimum: 5 }, allow_nil: true
  validates_presence_of :first_name, :last_name, :username, :email, :password, :password_confirmation
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def self.authenticate(login, password)
    user = find_by_login(login)
    user && user.authenticated?(password) ? user : nil
  end


private
  def set_invitation_limit
    self.invitation_limit = null
  end

end














