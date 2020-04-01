require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new
  end
  test 'You can create a user' do
    assert @user.valid?
  end
end
