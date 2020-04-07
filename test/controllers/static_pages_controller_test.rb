require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home and correct title" do
    # at the beginning it could have been: static_pages_home_url
    get root_url
    assert_response :success
    assert_select 'title', 'Sample-App'
  end

  test "should get about and correct title" do
    # at beginning it was: static_pages_about_url
    get about_url
    assert_response :success
    assert_select 'title', 'S-A | About'
  end

  test "should get contact and correct title" do
    get contact_path
    assert_response :success
    assert_select 'title', 'S-A | Contact'
  end

end
