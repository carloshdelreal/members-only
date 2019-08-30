# frozen_string_literal: true

require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'layout links' do
    # user is not logged in
    get root_path
    assert_template root_path
    assert_select 'a[href=?]', root_path, count: 0
    assert_select 'a[href=?]', posts_path
    assert_select 'a[href=?]', signup_path
    assert_select 'a[href=?]', login_path
    assert_select 'a[href=?]', profile_path, count: 0
    assert_select 'a[href=?]', logout_path, count: 0
    assert_select 'a[href=?]', new_post_path

    get signup_path
    assert_template 'users/new'

    post signup_url, params: { user: { name: @user.name,
                                       username: @user.username,
                                       email: @user.email,
                                       password: @user.password_digest } }

    follow_redirect!

    assert_select 'a[href=?]', root_path, count: 0
    assert_select 'a[href=?]', posts_path
    assert_select 'a[href=?]', signup_path, count: 0
    assert_select 'a[href=?]', login_path, count: 0
    assert_select 'a[href=?]', profile_path
    assert_select 'a[href=?]', logout_path
    assert_select 'a[href=?]', new_post_path

    # assert_select "title", full_title("Contact")
  end
end
