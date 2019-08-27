class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  before_action :not_logged_in_user, only:[:new, :create]
  


  # GET /users/1
  def show
    @user = current_user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
      
    else
      render :new 
      
    end
  
  end


  private
  
    # Never trust parameters from the scary internet, only allow the white list through.
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
      if logged_in?
        flash[:danger] = "You are already logged in!"
        redirect_to root_url
      end
    end
end
