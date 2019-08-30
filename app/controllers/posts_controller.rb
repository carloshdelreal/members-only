# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[create new]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to posts_path
      flash[:success] = 'Congratulations, You have Posted on Members Only!!'

    else
      flash.now[:danger] = 'There was a problem with your post'
      render :new
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:content)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end
end
