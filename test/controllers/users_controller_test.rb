# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should get new' do
    get signup_url
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post signup_url, params: { user: { name: @user.name,
                                         username: @user.username,
                                         email: @user.email,
                                         password: @user.password_digest } }
    end

    assert_redirected_to user_url(User.last)
  end

  test 'should show user' do
    post signup_url, params: { user: { name: @user.name,
                                       username: @user.username,
                                       email: @user.email,
                                       password: @user.password_digest } }

    log_in_as(@user)
    get profile_url(@user)
    assert_response :success
  end
end
