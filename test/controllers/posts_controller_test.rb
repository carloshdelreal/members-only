# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @user = users(:one)
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    assert_difference('User.count') do
      post users_url, params: { user: { name: @user.name,
                                        username: @user.username,
                                        email: @user.email,
                                        password: @user.password_digest } }
    end

    log_in_as(@user)
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    post signup_url, params: { user: { name: @user.name,
                                       username: @user.username,
                                       email: @user.email,
                                       password: @user.password_digest } }

    log_in_as(@user)
    assert_difference('Post.count') do
      # puts "Post content: #{@post.content}, User id: #{@post.user}"
      post posts_url, params: { post: { content: @post.content, user_id: @post.user } }
    end

    assert_redirected_to posts_url
  end
end
