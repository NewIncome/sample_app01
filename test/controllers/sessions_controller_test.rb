require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(name:    'testU1',
                        email:   'testU1@mail.com',
                        password:'testU1',
                        password_confirmation: 'testU1')
  end

  test 'shows a login form' do
    get login_path
    assert_response :success
  end

  test 'logs in and greets a new user' do
    get login_path
    post login_path, params: { session: { email:    'testU1@mail.com',
                                          password: 'testU1' } }
    assert_equal flash[:success], "#{@user.name}, you are logged in correctly"
    assert_not session[:user_id].nil?
  end

  test 'logs in and logs out a user' do
    get login_path
    post login_path, params: { session: { email:    'testU1@mail.com',
                                          password: 'testU1' } }
    assert_not session[:user_id].nil?
    delete logout_path
    assert session[:user_id].nil?
  end

end