class User < ActiveRecord::Base
  has_many :messages
  before_save { self.email = email.downcase }
  has_secure_password 
  validates :password, length: { minimum: 5 }, allow_nil: true
  validates_presence_of :first_name, :last_name, :username, :email, :password, :password_confirmation
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  has_many :sent_invitations
  belongs_to :invitation
  has_many :invitees, through: :friends
  has_many :friendships

  def self.authenticate(login, password)
    user = find_by_login(login)
    user && user.authenticated?(password) ? user : nil
  end


private
  def set_invitation_limit
    self.invitation_limit = null
  end

end














