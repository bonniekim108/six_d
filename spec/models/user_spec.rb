require 'rails_helper'

RSpec.describe User, type: :model do

  it "has a valid model" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "is invalid without a first name" do
    user = build(:user, first_name: nil)
    expect(user).to be_invalid
  end

  it "is invalid without a last name" do
    user = build(:user, last_name: nil)
    expect(user).to be_invalid
  end

  it "is invalid without a username" do
    user = build(:user, username: nil)
    expect(user).to be_invalid
  end

  it "is invalid without an email address" do
    user = build(:user, email: nil)
    expect(user.valid?).to eq(false)
  end

  it "is invalid with a password of less than 5 characters" do
    user = build(:user, password: 'abc', password_confirmation: 'abc')
    user.valid?
    expect(user.errors[:password]).to include('is too short (minimum is 5 characters)')
  end

  it 'is invalid without a matching password_confirmation' do
    user = build(:user, password: 'abc123', password: '123abc')
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end

  it "is invalid if email isn't formatted properly" do
    emails = ["asfasd", "sadfas@f", "asf.df2", "a sdfas"]
    emails.each do |email|
      user = build(:user, email: "bdadfasdfa")
      expect(user).to be_invalid
    end
  end

  it "is invalid with a duplicate email regardless of capitalization" do
    user = create(:user, email: 'bradpitt@example.com')
    new_user = build(:user, email: "Bradpitt@example.com")
    expect(new_user).to be_invalid
  end

end
