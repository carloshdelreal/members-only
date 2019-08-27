class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember(user)
      current_user
      redirect_to posts_path
      flash[:danger] = 'Congratulations, You Have logged In!!'
    else 
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
    flash[:danger] = 'Congratulations, You Have logged Out!!'
  end


  
  
end
