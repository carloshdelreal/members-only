# frozen_string_literal: true

require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'Sign up, logout, and login' do
    # user is not logged in
    get signup_path
    assert_template 'users/new'

    post signup_url, params: { user: { name: @user.name,
                                       username: @user.username,
                                       email: @user.email,
                                       password: @user.password_digest } }

    follow_redirect!
    assert_response :success
    assert_template 'users/show'

    ## then I logout

    delete logout_path
    follow_redirect!
    assert_template 'posts/index'
    assert_response :success

    # then log in again

    get login_path
    assert_template 'sessions/new'
    assert_response :success

    post signup_url, params: { user: { email: @user.email,
                                       password: @user.password_digest } }
    follow_redirect!

    assert_template 'users/show'

    assert_response :success

    # assert_select "title", full_title("Contact")
  end
end
