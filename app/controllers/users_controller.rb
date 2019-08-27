class UsersController < ApplicationController


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
      params.fetch(:user, {})
    end
end
