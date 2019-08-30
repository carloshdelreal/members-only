class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  before_action :not_logged_in_user, only:[:new, :create]

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end
 
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      remember @user
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  private
  
    def user_params
      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end

    def logged_in_user
			unless logged_in?
				flash[:danger] = "Please log in."
				redirect_to login_url
			end
    end

    def not_logged_in_user
      unless logged_in? == false
        flash[:danger] = "You are already logged in!"
        redirect_to root_url
      end
    end
end
