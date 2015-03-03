class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :invitee

  # attr_accessible :user, :invitee
end