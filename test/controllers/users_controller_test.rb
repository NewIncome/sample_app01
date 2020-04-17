require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(name:    'testU1',
                        email:   'testU1@mail.com',
                        password:'testU1',
                        password_confirmation: 'testU1')
  end

  test "should get show of created user" do
    get user_url(@user.id)
    assert_response :success
  end

  test "should get signup" do
    get signup_url
    assert_response :success
  end

end
