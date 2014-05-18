require 'test_helper'

class TwitterControllerTest < ActionController::TestCase
  test "should get tweets" do
    get :tweets
    assert_response :success
  end

  test "should get common_friends" do
    get :common_friends
    assert_response :success
  end

end
