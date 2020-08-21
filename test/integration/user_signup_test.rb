require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "can sign up a new user" do
    get signup_path
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { user_name: "Bao", email: "bao@email.com",
                                         password: "password", password_confirmation: "password" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end

  test "will reject invalid params from user signup " do
    get signup_path
    assert_response :success
    assert_no_difference 'User.count' do
      post users_path, params: { user: { user_name: "", email: "bao@email.com",
                                         password: "password", password_confirmation: "password" } }
    end
    assert_response :success
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end


end
