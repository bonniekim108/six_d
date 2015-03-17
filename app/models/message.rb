class Message < ActiveRecord::Base
  belongs_to :user
  field :subject
  field :sender
  field :body
  field :senderid
  field :user_id
end
