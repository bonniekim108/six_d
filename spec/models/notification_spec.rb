require 'rails_helper'

RSpec.describe Notification, type: :model do
  

  it "has a valid factory" do
    notification = build(:notification)
    expect(notification).to be_valid
  end

  it "is invalid without a user id" do
    notification = build(:notification, user_id: nil)
    expect(notification.valid?).to eq(false)
  end

end
