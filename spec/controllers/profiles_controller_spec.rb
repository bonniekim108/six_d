require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  it "should show the show page" do
    get :show, id: users(:user).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  it "should render 404 page on profile page not found" do
    get :show, id: "does not exist"
    assert_response :not_found
  end

end
