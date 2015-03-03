class User < ActiveRecord::Base


  attr_accessor :remember_token, :activation_token
  before_save :downcase_email
  before_create :create_activation_digest

  has_secure_password 
  validates :password, length: { minimum: 5 }, allow_nil: true
  validates_presence_of :first_name, :last_name, :username, :password, :password_confirmation
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  has_many :sent_invitations
  belongs_to :invitation
  has_many :invitees, through: :friendships
  has_many :friendships
  has_many :notifications, dependent: :destroy # a user's notifications are destroyed along with user

  # Returns hash digest of string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #User is remembered in database 
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  # True if token matches digest
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def full_name
    first_name + " " + last_name
  end

  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_email
    UserMailer.welcome_email(self).deliver_now
  end

  def feed
    Notification.where("user_id = ?", id)
  end

private
  
  # Converts all email to lower case
  def downcase_email
    self.email = email.downcase
  end

  # Creates, assigns activation token and activation digest
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end 









