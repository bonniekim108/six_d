class User < ActiveRecord::Base


  has_many :sent_invitations
  belongs_to :invitation

  before_create :set_invitation_limit

  attr_accessible :name, :email, :password, :password_confirmation

  def self.authenticate(login, password)
    user = find_by_login(login)
    user && user.authenticated?(password) ? u : nil
  end

  private

  def set_invitation_limit
    self.invitation_limit = null
  end

end














