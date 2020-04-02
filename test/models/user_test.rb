require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user1 = User.new(name:'JPablo',
                     email:'pablo@example.com',
                     password:'pablito',
                     password_confirmation:'pablito')
    @user2 = User.new(name:'',
                     email:'',
                     password:'doh',
                     password_confirmation:'doh')
  end

  test 'User can be created' do
    assert @user1.valid?
  end

  test 'User cannot have a name, email nor password blank' do
    @user2.valid?
    assert_equal 4, @user2.errors.full_messages.count
  end

  test "User mustn't have a short password" do
    @user1.password = 'pablo'
    assert_not @user1.valid?
  end

  test 'email must be unique' do
    @user1.save
    @user2.email = @user1.email
    @user2.valid?
    assert_includes @user2.errors.full_messages, 'Email has already been taken'
  end
end
